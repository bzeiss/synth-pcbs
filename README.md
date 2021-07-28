# synth-pcbs
This site contains some stuff I have built for some synths/samplers I own.

I tinker with electronics, release stuff when I feel like it and I make it public when it's maybe not perfect. I'm not an electronics expert, so I may not always know what I'm doing. I learn the necessary electronics as I use it. Use at your own risk.

Be smart. Don't just trust the stuff I offer for download here. Take a look at the schematic and the PCB design beforehand.

Feedback is always very welcome 😄

## EastRising ERM24064 Display adapter EMU E4-Series Samplers

The ERM24064 is fully compatible to T6963 and is thus mostly a plug and play replacement. However, the contrast needs to be adjusted in order to work with EMU samplers. The adapter PCB provides control for the contrast and backlight through trimpots. Other than that, it's mostly a pass-through PCB and just a nicer solution than integrating the trimpots in the wiring. The PCB is a result of pointers given in the E-MU Emulator IV User Group on Facebook who had built this solution (without a special adapter PCB) already.

<p float="left">
  <img src="https://user-images.githubusercontent.com/884834/127341468-0918074d-10b2-4ca4-a909-95c9aaf23048.png" width="250">
  <img src="https://user-images.githubusercontent.com/884834/127341538-cb33b2b2-d624-414b-addd-1f36439a2f29.png" width="250">
  <img src="https://user-images.githubusercontent.com/884834/127341538-cb33b2b2-d624-414b-addd-1f36439a2f29.png" width="250">
  <img src="https://user-images.githubusercontent.com/884834/127345071-0c13f12a-3d36-4c66-9a55-e97e7d114562.jpg" width="250">
</p>

### Bill of Materials

| Quantity      | Label | Part                                | Example URL |
| ------------- | ------| -------                             | ----------- |
| 1             | RV1   | Trimpot 9mm 10k Ohms                | https://www.reichelt.de/einstellpotentiometer-liegend-10-kohm-9-mm-ca9pv10-10ka2020-p266604.html |
| 1             | RV2   | Trimpot 9mm 1k Ohms                 | https://www.reichelt.de/einstellpotentiometer-liegend-1-0-kohm-9-mm-acp-9-l-1k-p110250.html |
| 1             | J1    | 2x11 2.54mm pin socket              | https://www.reichelt.de/buchsenleisten-2-54-mm-2x11-gerade-mpe-094-2-022-p119933.html |
| 1             | J2    | 2x10 2.54mm pin header (shrouded)   | https://www.reichelt.de/wannenstecker-20-pol-gerade-han-520-6324-p175352.html |
