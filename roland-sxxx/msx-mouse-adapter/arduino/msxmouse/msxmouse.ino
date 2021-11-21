
    /////////////////////////////
   //  PS/2-mouse to MSX v1.1 //
  //  Made By: NYYRIKKI 2014 //
 ////////////////////////////

/*
   Usage:
   Press reset = Mouse mode
   Press reset & hold right mousebutton down = Joystick emulation
   Press reset & hold left mousebutton down = Mouse + Joystick emulation (*)

   If you have mouse with a scrolling wheel (optional) you can use the
   wheel to adjust speed of mouse / sensitivity of joystick.

   If status LED does NOT blink check your PS2-mouse connection and press reset.

   (*) Please note: This mode might cause problems with some of the existing software.
//////////////////////////////////////////////////////////////////////////////////*/

// As of Arduino 1.0 ps2.zip should be unpacked into arduino/libraries.
// In ps2.h replace "WProgram.h" with "Arduino.h".

  #include <ps2.h>
  #include <EEPROM.h>

  /////////////////////////////////
 // HW Connection instructions: //
/////////////////////////////////

// PS/2 connector: (Female)   USB-connetor: (Female)
//
//           1 2                    ---------
//          3   4                  | 4 3 2 1 |
//           5|6                    -=======-
//
//        Mini-DIN-6F                 USB-AF
//
//            (Both looking from outside)
//
// Connecting PS2:
// pin 1 -> DATA
// pin 3 -> GND
// pin 4 -> +5V
// pin 5 -> CLK

// Define Arduino pins used in format: CLK , DATA

  PS2 mouse(11, 10);

// If you use USB-connector, connect:
// pin 1 -> +5V
// pin 2 -> DATA
// pin 3 -> CLK
// pin 4 -> GND
//
// Usually USB-mice that are produced before 2010 support PS/2 protocol out of the box.
//
// Connecting Joystick:
//
//  MSX-connector : Arduino pin
//     (DB9F)
//  #define JoyPin1 2
//  #define JoyPin2 3
//  #define JoyPin3 4
//  #define JoyPin4 5
//  //      JoyPin5 +5V (N/C or power)
//  #define JoyPin6 6
//  #define JoyPin7 7
//  #define JoyPin8 8
//  //      JoyPin9 GND (Connect to Arduino GND)

//  #define InfoPin 13 // Status LED

  
  #define JoyPin1 2
  #define JoyPin2 3
  #define JoyPin3 4
  #define JoyPin4 5
  //      JoyPin5 +5V (N/C or power)
  #define JoyPin6 6
  #define JoyPin7 7
  #define JoyPin8 8
  //      JoyPin9 GND (Connect to Arduino GND)


  #define InfoPin 13 // Status LED

///////////////////////////////////////////////////////////////////////////////

// Variables
  char rx=0,ry=0,rz=0,scale=20,MouseID=0,EmuMode=1, TimeOut=40;
  char x=0,y=0,z=0,mx=0,my=0;
  char slx=0,sly=0;
  char olimit=60, ilimit=50, solimit=0, silimit=0, mstat=0, StatCnt=0, but34=0,lx=0,ly=0;
  int SI=0,SO=0,jx=0,jy=0;
  long time; // No C

void mouse_init()
{
  mouse.write(0xff);   // reset
  mouse.read();        // ack byte
  mouse.read();        // Self-test passed
  mouse.read();        // Mouse ID
  mouse.write(0xf0);   // remote mode
  mouse.read();        // ack

  // EmuModes:
  // 1 = Mouse (Compatibility mode)
  // 2 = Extended mouse only
  // 3 = Extended mouse + Joystick
  // 4 = Joystick
  // 5 = Trackball
  // 6 = Touchpad

  EmuMode = EEPROM.read(500);
  if (EmuMode>6 | EmuMode <1) {EmuMode=1;EEPROM.write(500,EmuMode);}
  
  mstat=getmstat();
  if (mstat & 2) {
    digitalWrite(InfoPin,HIGH);
    do {delay(200);mstat=getmstat();} while (mstat & 2);
    digitalWrite(InfoPin,LOW);
    EmuMode=0;
    Serial.print("Config mode...");
    do
    {
      mstat=getmstat();
      if (mstat & 1) {
       digitalWrite(InfoPin,HIGH);
       do {delay(20);mstat=getmstat();} while ((mstat & 1) & (mstat & 2)==0);     
       digitalWrite(InfoPin,LOW);
       EmuMode++;
       if (EmuMode==7) EmuMode=1;
      }
    } while ((mstat & 2)==0 | (EmuMode==0));
  }
 
 //if (EmuMode==0) EmuMode=1;
 
 if (mstat & 3 == 3) EEPROM.write(500,EmuMode);

 // Blink emumode

 delay(400);
 for (int Cntr=0; Cntr < EmuMode; Cntr++){
   digitalWrite(InfoPin,HIGH);
   delay(200);
   digitalWrite(InfoPin,LOW);
   delay(200);
 }  
 
  MouseSpeed(200);
  MouseSpeed(200);
  MouseSpeed(80);


  mouse.write(0xf2);   // Get device ID
  mouse.read();        // ack
  MouseID = mouse.read();   // Mouse ID
  if (MouseID != 4) {

     MouseSpeed(200);
     MouseSpeed(100);
     MouseSpeed(80);

     mouse.write(0xf2);   // Get device ID
     mouse.read();        // ack
     MouseID = mouse.read();   // Mouse ID
  }

  MouseSpeed(200);

  mouse.write(0xe8);   // Set Resolution
  mouse.read();        // ack
  mouse.write(2);      // 4 counts/mm
  mouse.read();        // ack

  //delayMicroseconds(100);
}

void setup()
{
  digitalWrite(JoyPin1,LOW);
  digitalWrite(JoyPin2,LOW);
  digitalWrite(JoyPin3,LOW);
  digitalWrite(JoyPin4,LOW);
  digitalWrite(JoyPin6,LOW);
  digitalWrite(JoyPin7,LOW);

  digitalWrite(InfoPin,LOW);
  pinMode(InfoPin,OUTPUT);

  Serial.begin(9600);
  Serial.write(127);
  time=millis()+5000;
  while(time>millis()) {
   if (Serial.available() > 0) {if (Serial.read()==65) Loader;}
  }
  
  Serial.print("\n\n");
  Serial.print("PS/2-mouse to MSX-mouse converter for Arduino version 1.1\n");
  Serial.print("---------------------------------------------------------\n");
  Serial.print("Made By: NYYRIKKI 2014\n\n");
  Serial.print("Initializing PS/2 mouse...");
  mouse_init();
  Serial.print("Ok\n\nI'm a ");
  switch (EmuMode) {
    case 1: Serial.print("mouse in compatibility mode");
    break;
    case 2: Serial.print ("mouse");
    break;
    case 3: Serial.print ("mouse & joystick hybrid");
    break;
    case 4: Serial.print("joystick");
    break;
    case 5: Serial.print("trackball");
    break;
    case 6: Serial.print("touchpad");
    break;
       
  }
  Serial.print("!\n");
}

void loop()
{
  StatCnt++;
  if (StatCnt==50) StatCnt=0;

  mouse.write(0xeb);    // give me data!
  mouse.read();         // ignore ack
  mstat = mouse.read(); // Read buttons

  rx = mouse.read();
  ry = mouse.read();

  if (MouseID==3) {
    rz=mouse.read();
  }
  if (MouseID==4) {
    rz=mouse.read();
    but34=(rz>>3) & 6;
    rz=rz & 15;
    if (rz & 8) {rz = rz|240;}
  }
  x = x+rx;
  y = y-ry;
  z = z-rz;

// Buttons
  if (EmuMode==6) { // Touchpad
     if(mstat&1) pinMode(JoyPin4,OUTPUT); else pinMode(JoyPin4,INPUT);
     if(mstat&2) pinMode(JoyPin1,INPUT); else pinMode(JoyPin1,OUTPUT);
  } else { // Others
     if(mstat&1) pinMode(JoyPin6,OUTPUT); else pinMode(JoyPin6,INPUT);
     if(mstat&2) pinMode(JoyPin7,OUTPUT); else pinMode(JoyPin7,INPUT);   
  }

  if (EmuMode==1 | EmuMode>4) { // Scale mouse/trackball/touchpad output
     scale=scale-rz;
     if (scale<5) scale=5;
     if (scale>25) scale=25;
     mx=x*(scale)/20+slx;
     my=y*(scale)/20+sly;
     
     if (scale<20) {
       lx=x-(mx*20/scale);
       ly=y-(my*20/scale);
     } else {
       lx=0;ly=0;
     }
     
  } else {
     mx=x;
     my=y;
  }

  time=millis()+40;

  if (EmuMode<4) {  // Mouse emulation

    sendMSX(-mx);
    time=millis()+3;
    sendMSX(-my);
    if (millis()<time) {
      x=lx;y=ly;
//      x=0;y=0;
      if (EmuMode==2 | EmuMode==3) {
        sendMSX(((mstat>>2) & 1)| but34 | 16);
        sendMSX(-z);
        if (millis()<time) {z=0;}
      }

      
      if (StatCnt<25) digitalWrite(InfoPin,LOW); else digitalWrite(InfoPin,HIGH);

      time=millis()+2;
    } else if (StatCnt<48) digitalWrite(InfoPin,LOW); else digitalWrite(InfoPin,HIGH);

    while (digitalRead(JoyPin8)==LOW) {if (millis()>time) break;};
    JoyHigh();
  }

  if (EmuMode==3 | EmuMode==4){   // Joystick emulation

    jy=jy+ry;
    jx=jx-rx;
    if (StatCnt<40) digitalWrite(InfoPin,LOW); else digitalWrite(InfoPin,HIGH);
    if (digitalRead(JoyPin8)==LOW) {
      solimit=olimit*(scale)/20;
      silimit=ilimit*(scale)/20;

      if (jy>solimit) jy=solimit;
      if (jy<-solimit) jy=-solimit;
      if (jx>solimit) jx=solimit;
      if (jx<-solimit) jx=-solimit;

      if (jy>silimit)  pinMode(JoyPin1,OUTPUT); else pinMode(JoyPin1,INPUT);
      if (jy<-silimit) pinMode(JoyPin2,OUTPUT); else pinMode(JoyPin2,INPUT);
      if (jx>silimit)  pinMode(JoyPin3,OUTPUT); else pinMode(JoyPin3,INPUT);
      if (jx<-silimit) pinMode(JoyPin4,OUTPUT); else pinMode(JoyPin4,INPUT);
    } else JoyHigh();
  }
  
  if (EmuMode==5) {   // Trackball emulation
  
  // To be done
    if (mx>7) {slx=mx-7;mx=7;} else 
    { 
      if (mx<-7) {slx=mx+7;mx=-7;} else {slx=0;}
    }
    if (my>7) {sly=my-7;my=7;} else 
    { 
      if (my<-7) {sly=my+7;my=-7;} else {sly=0;}
    }
    
    //if (scale>20) {slx=0;sly=0;}
    
    mx=((mx^8)&15);
    my=((my^8)&15);
    
    mx=((DDRD & 195)|((~ (mx<<2)) & 60));
    my=((DDRD & 195)|((~ (my<<2)) & 60));
    
    DDRD = mx;x=lx;
    while (digitalRead(JoyPin8)==LOW) {if (millis()>time) break;};
    
    DDRD = my;y=ly;
    while (digitalRead(JoyPin8)==HIGH) {if (millis()>time) break;};

    DDRD = mx;mx=8;
    mx=((DDRD & 195)|((~ (mx<<2)) & 60));
    while (digitalRead(JoyPin8)==LOW) {if (millis()>time) break;};
    
    DDRD = mx;
    while (digitalRead(JoyPin8)==HIGH) {if (millis()>time) break;};
  
    while (digitalRead(JoyPin8)==LOW) {if (millis()>time) break;};

    while (digitalRead(JoyPin8)==HIGH) {if (millis()>time) break;};

       
       
    delay(3);
    JoyHigh();
  }
  if (EmuMode==6) {   // Touchpad emulation
  
    jx=jx+mx;
    jy=jy+my;
    x=lx;y=ly;
    
    if (jx>255) jx=255;
    if (jx<0) jx=0;
    if (jy>255) jy=255;
    if (jy<0) jy=0;

    
    if (SI==0) {SO=jx;} else {SO=jy;}
    SI=0;  
  
    pinMode(JoyPin2,INPUT);  // Ei kiirettÃ¤
    while (digitalRead(JoyPin8)==HIGH) {if (millis()>time) break;}; // Wait for select
    for (int i=0; i < 8; i++){
      while (digitalRead(JoyPin6)==HIGH) {if (millis()>time) break;};
      if(SO&128) pinMode(JoyPin3,INPUT); else pinMode(JoyPin3,OUTPUT);SO=SO<<1;
      while (digitalRead(JoyPin6)==LOW) {if (millis()>time) break;};
      SI=SI<<1;if (digitalRead(JoyPin7)==HIGH) {SI++;};
    }
     pinMode(JoyPin2,OUTPUT); // Kiire
   while (digitalRead(JoyPin8)==LOW) {if (millis()>time) break;};
  
  }
}

/*
void sendMSX(char c)
// Standard version
{
    while (digitalRead(JoyPin8)==LOW) {if (millis()>time) return;};
    if(c&128) pinMode(JoyPin4,INPUT); else pinMode(JoyPin4,OUTPUT);
    if(c&64)  pinMode(JoyPin3,INPUT); else pinMode(JoyPin3,OUTPUT);
    if(c&32)  pinMode(JoyPin2,INPUT); else pinMode(JoyPin2,OUTPUT);
    if(c&16)  pinMode(JoyPin1,INPUT); else pinMode(JoyPin1,OUTPUT);
    while (digitalRead(JoyPin8)==HIGH) {if (millis()>time) return;};
    if(c&8)   pinMode(JoyPin4,INPUT); else pinMode(JoyPin4,OUTPUT);
    if(c&4)   pinMode(JoyPin3,INPUT); else pinMode(JoyPin3,OUTPUT);
    if(c&2)   pinMode(JoyPin2,INPUT); else pinMode(JoyPin2,OUTPUT);
    if(c&1)   pinMode(JoyPin1,INPUT); else pinMode(JoyPin1,OUTPUT);
}

*/
void sendMSX(char c)
// Optimized for Atmel328
// NOTE: Fixed pins!
{
    while (digitalRead(JoyPin8)==LOW) {if (millis()>time) return;};
    DDRD = ((DDRD & 195)|((~ (c>>2)) & 60));
    while (digitalRead(JoyPin8)==HIGH) {if (millis()>time) return;};
    DDRD = ((DDRD & 195)|((~ (c<<2)) & 60));
}

/*
void JoyHigh()
// Standard version
{
    pinMode(JoyPin1,INPUT);
    pinMode(JoyPin2,INPUT);
    pinMode(JoyPin3,INPUT);
    pinMode(JoyPin4,INPUT);
}
*/
void JoyHigh()
// Optimized for Roland
// NOTE: Fixed pins!
{
     DDRD=(DDRD | 0x3C);
//     DDRD=(DDRD & 195);
}

void MouseSpeed(char C)
{
  mouse.write(0xf3);   // Set sample rate
  mouse.read();        // ack
  mouse.write(C);    // Max sample rate
  mouse.read();        // ack
}

char getmstat()
{
  mouse.write(0xeb);   // give me data!
  mouse.read();        // ignore ack
  char stat = mouse.read(); // Read Emulation mode from buttons
  mouse.read();        // ignore X
  mouse.read();        // ignore Y 
  return stat;
}

////////////////////////////////////////////////////////////////

void Loader()
{    
  
int FileLen,LenCnt=0,SI=0,SO=0,VR=5,V2=6,LL=0;
char a;
  
while(Serial.available() < 2) {}
FileLen=Serial.read()+Serial.read()*256;  
LenCnt=0;

while(LenCnt<=FileLen)
{
  //LL++;
  if (VR==0 & V2==0 & SI==0) {
    if (Serial.available() == 0) {Serial.print(".");}
    while(Serial.available() == 0) {}
    a=Serial.read();
    LenCnt++;
    // Serial.print(a);
  }
  V2=VR;
  VR=SI;
  if (SI==0) {SO=a;} else {SO=0;}
  SI=0;  
  
  pinMode(JoyPin2,INPUT);  // Ei kiirettÃ¤
  while (digitalRead(JoyPin8)==HIGH) {;;;}; // Wait for select
  for (int i=0; i < 8; i++){
    while (digitalRead(JoyPin6)==HIGH) {;;;};
    if(SO&128) pinMode(JoyPin3,INPUT); else pinMode(JoyPin3,OUTPUT);SO=SO<<1;
    while (digitalRead(JoyPin6)==LOW) {;;;};
    SI=SI<<1;if (digitalRead(JoyPin7)==HIGH) {SI++;};
  }
     pinMode(JoyPin2,OUTPUT); // Kiire
   while (digitalRead(JoyPin8)==LOW) {;;;};
}
 
pinMode(JoyPin3,INPUT); // Ei kiire
pinMode(JoyPin4,INPUT); // Ei kiire
pinMode(JoyPin6,OUTPUT); // Sync
pinMode(JoyPin7,OUTPUT); // Data
pinMode(JoyPin8,INPUT); // Ei kiire

pinMode(JoyPin1,INPUT); // Valmis
pinMode(JoyPin2,INPUT); // Ei kiire


Serial.print(".");

digitalWrite(InfoPin,HIGH);
    
/////////////////////////////////////////////////////

 while(Serial.available() < 2) {}
 FileLen=Serial.read()+Serial.read()*256;  
 LenCnt=0;

 while(LenCnt<=FileLen)
 {

    while(Serial.available() == 0) {}

    a=Serial.read();  
    LenCnt++;

    while (digitalRead(JoyPin8)==LOW) {};
    DDRD = ((DDRD & 131)|(((~(a<<2)) & 60))+0);
    while (digitalRead(JoyPin8)==HIGH) {};
    DDRD = ((DDRD & 131)|(((~(a>>2)) & 60))+64);
 
        
    while (digitalRead(JoyPin8)==LOW) {};
    DDRD = ((DDRD & 131)|(((~(a>>2)) & 60))+0);
    while (digitalRead(JoyPin8)==HIGH) {};
    DDRD = ((DDRD & 131)|(((~(a<<2)) & 60))+64);
 }
 
 digitalWrite(InfoPin,HIGH);

    pinMode(JoyPin7,INPUT);
    pinMode(JoyPin6,INPUT);
    
}
  
