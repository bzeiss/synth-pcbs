# synth-pcbs
This site contains some stuff I have built for some synths/samplers I own.

I tinker with electronics, release stuff when I feel like it and I make it public when it's maybe not perfect. I'm not an electronics expert, so I may not always know what I'm doing. I learn the necessary electronics as I use it. Use at your own risk.

Be smart. Don't just trust the stuff I offer for download here. Take a look at the schematic and the PCB design beforehand.

Feedback is always very welcome 😄

## EastRising ERM24064 Display adapter EMU E4-Series Samplers

The ERM24064 is fully compatible to T6963 and is thus mostly a plug and play replacement. However, the contrast needs to be adjusted in order to work with EMU samplers. The adapter PCB provides control for the contrast and backlight through trimpots. Other than that, it's mostly a pass-through PCB and just a nicer solution than integrating the trimpots in the wiring. The PCB is a result of pointers given in the E-MU Emulator IV User Group on Facebook who had built this solution already (without a special adapter PCB).

Use at your own risk.

<p float="left">
  <img src="https://user-images.githubusercontent.com/884834/127341468-0918074d-10b2-4ca4-a909-95c9aaf23048.png" width="250">
  <img src="https://user-images.githubusercontent.com/884834/127341538-cb33b2b2-d624-414b-addd-1f36439a2f29.png" width="250">
  <img src="https://user-images.githubusercontent.com/884834/127345071-0c13f12a-3d36-4c66-9a55-e97e7d114562.jpg" width="350">
  <img src="https://user-images.githubusercontent.com/884834/127345339-07a29225-bfab-4588-b0c8-9b17fc1d1aa0.jpg" width="450">
</p>

### Bill of Materials

For assembling, the adapter PCB, you'll need the parts in the following table. You can order from an electronics shop in your region, but you'll easily find those parts also at mouser or digikey. The example URLs are just that, examples. The trimpots in the URLs and images are slightly different from each other. I bought the parts that were available and didn't care for the exact same model.

| Quantity      | Label | Part                                | Example URL |
| ------------- | ------| -------                             | ----------- |
| 1             | RV1   | Trimpot 9mm 10k Ohms (contrast)     | https://www.reichelt.de/einstellpotentiometer-liegend-10-kohm-9-mm-ca9pv10-10ka2020-p266604.html?LANGUAGE=EN |
| 1             | RV2   | Trimpot 9mm 1k Ohms (backlight)     | https://www.reichelt.de/einstellpotentiometer-liegend-1-0-kohm-9-mm-acp-9-l-1k-p110250.html?LANGUAGE=EN |
| 1             | J1    | 2x11 2.54mm pin socket              | https://www.reichelt.de/buchsenleisten-2-54-mm-2x11-gerade-mpe-094-2-022-p119933.html?LANGUAGE=EN |
| 1             | J2    | 2x10 2.54mm pin header (shrouded)   | https://www.reichelt.de/wannenstecker-20-pol-gerade-han-520-6324-p175352.html?LANGUAGE=EN |

In addition, you'll need 
- a 240x64 ERM24064 T6963 compatible display. I get these from buydisplay: https://www.buydisplay.com/graphic-display/graphic-display-module?resolution=158
- The PCB itself. Use the [Gerber Zip file](https://github.com/bzeiss/synth-pcbs/raw/main/emu-iv/ERM24064-adapter/gerber/ERM24064-v1.0.zip) and order it from a PCB supplier of your choice. I usually use JLCPCB. If you haven't done this before, search youtube for keywords like "order pcb jlcpcb" or something similar. You can as well use any other supplier like PCBWay or OSH park. I suggest you try to find out the shipping costs involved and choose the cheapest one for your country. The quality is sufficient from any of them (as far as I know).

Equipment needed:
- Soldering iron
- Solder with flux core
- Optional: solder wick and flux in case you make mistakes in the soldering process.

### Build instructions
- Step 1: Assemble the parts as shown on the images. Make sure you don't solder anything the wrong way round. Use the images as reference.
- Step 2: Once the PCB is assembled, you plug in the 2x11 pin socket (J1) into the ERM24064 display as shown in the picture. The trimpots point downwards.
- Step 3: Unplug the sampler from power. Open the E4 sampler. Unplug the cable from the display and put it into the shrouded pin header. The red line points upwards. See picture. Don't permanently mount the display yet, but have it somewhere next to sampler or in your hands. Don't touch any contacts, solder joints etc.
- Step 4: Make sure both trimpots are adjusted to be somewhere in the middle to start with.
- Step 5: Turn on the sampler and test the display. Adjust the trimpots. Start with RV1 (contrast) and adjust it until you see the text clearly.
- Step 6: Adjust RC2 (backlight) and adjust it to your liking. However, make sure that the same contrast on the E4 is confiured to a useful setting when adjusting the trimpots (Master->Setup->Misc->Contrast=+0). As I'm not sure how much resistance there is on the actual display board, I suggest to have the backlight not fully turned on, but leave some amount of resistance on the trimpot.
- Step 7: If everything works, you can mount the new display. Remove the backlight connector of the old display from the mainboard (CN2 for Ultra mainboards). It's not needed when using the new display with the display adapter as the backlight receives its power and ground from the display connector. 
- Step 8: close the sampler again.
