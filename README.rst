.. |ss| raw:: html

    <strike>

.. |se| raw:: html

    </strike>
******
README
******

This is the first successful PCB I've designed. I made it as part of `TeachMePCB's <https://www.teachmepcb.com>`_ PCB Layout 101 class.

Everyone in the course made a macrokeypad of some sort. The core "requirements" were:

* 10 MX-style key switches
* 2 Rotary Encoders with RGB leds
* VEML7700 Ambient Light Sensor (I2C)
* NLSF595 LED Driver (SPI)
* 10 NeoPixel lights (1-wire)
* Don't make a rectangular PCB
* Raspberry Pi Pico microcontroller

I made a couple of changes:

* Swapped PCA9745B for NLSF595
* Added ePaper display (because why not make my first project harder)

Required Libraries
==================
* Standard CircuitPython
* Adafruit CircuitPython Library
    * adafruit_hid
    * adafruit_led_animation
    * adafruit_debouncer
    * adafruit_veml7700
    * adafruit_display_text
    * adafruit_button
* `fergcorp_pca9745b <https://github.com/fergbrain/Fergcorp_CircuitPython_PCA9745B>`_
* `fergcorp_pdispectra <https://github.com/fergbrain/Fergcorp_CircuitPython_PDISpectra>`_

Build Notes and Errata:
=======================
For P/N 21-11.03-3, Rev NEW
---------------------------
**Last updated: 2 Feb 2022**

R1 (c5022a6)
^^^^^^^^^^^^

U401 (PI4ULS5V201TAEX), Pin 6:

* IS: Connected to ground.
* SHOULD BE: Connected to 5V+ via a 4.7K ohm resistor

*Note: All annotations on the PCB were also reset and reassigned. However, the original annotation designations are used in this document.*

R2 (fcf9d7e)
^^^^^^^^^^^^
R2404, Pin 03 (SPI_MISO) of U2701 (PCA9745BTWJ)

* IS: Connected to SPI_MISO via R2704 (1k ohm)
* SHOULD BE: No resistor

Pin 27 (SPI_MOSI) of U2701 (PCA9745BTWJ)

* IS: Connected to SPI_MOSI via R2706 (1k ohm)
* SHOULD BE: No resistor

R2707, Pin 26 (SPI_SCLK) of U2701 (PCA9745BTWJ)

* IS: Connected to SPI_SCLK via R2707 (1k ohm)
* SHOULD BE: No resistor

R3 (bb8617a)
^^^^^^^^^^^^
S3001 (Rotary Encoder)

* IS: Pin 01 (red LED) and Pin 04 (blue LED) are swapped
    * S3001 Pin 01 (red LED) goes to U2701 Pin 13 (blue LED)
    * S3001 Pin 04 (blue LED) goes to U2701 Pin 11 (red LED)

* SHOULD BE:

    * S3001 Pin 01 (red LED) connects to 2701 Pin 11 (red LED)
    * S3001 Pin 04 (blue LED) to U2701 Pin 13 (blue LED)

*Note: This has been fixed in software for this version of the PCB*

R4 (3040ea1)
^^^^^^^^^^^^
J2901 (Connector for epaper) Pin 11 (Data/Command) and Pin 09 (Busy)

* IS:

    * U2801 Pin 15 labeled as GPIO12 and connects to J2901 Pin 11
    * U2801 Pin 16 is labeled as GPIO11 and connects to J2901 Pin 09

* SHOULD BE:

    * U2801 Pin 15 labeled as GPIO11 and connects to Pin 09
    * U2801 Pin 16 labeled as GPIO12 and connects to Pin 11

*Note: This has been fixed in software for this version of the PCB*

R5 (51e2212 / 8b634cf)
^^^^^^^^^^^^
* IS: R2901 is 470 ohms
* SHOULD BE: R2901 is 0.47 ohms

|ss| R6 (196a722) |ss|
^^^^^^^^^^^^

* IS: J2901 (Connector for epaper) Pin 10 (Reset) connected to +3.3V via R2902 (100k ohm)
* SHOULD BE: J2901 Pin 10 connected to U2801 Pin 14 (GPIO10)

*Note: This results in SWITCH 4 and ePaper Reset sharing a pin because there are no other pins available. The primary result is that careful context switching needs to managed in software to:*

1.	Deinitialize GPIO10 as an input for SWITCH 4
2.	Setup the ePaper display interface (which uses GPIO10 as an output)
3.	Perform whatever ePaper update is needed
4.	Deinitialze the ePaper interface (which deinitializes GPIO10 as an output)
5.	Re-initialize GPIO10 as an input for SWITCH 4

*Also, while the ePaper is not enabled (i.e. not initialized/reinitialized), GPIO17 (ePaper CS) needs to be set HIGH to prevent the ePaper controller from thinking that data on the SPI line is intended for it.*
|se|

R7 (80c609b)
^^^^^^^^^^^^
* IS: J2901 is Molex P/N 5052782433
* SHOULD BE: J2901 is Amphenol P/N F31L-1A7H1-11024

* IS: Component S201 and S3001 is SparkFun P/N COM-15141
* SHOULD BE: Bournes P/N PEL12T-4225S-S1024

*Note: COM-15141 was originally sourced as an alternate since the Bournes parts weren’t avaible. However, COM-15141 has quality control issues, including the Red LED not working well and the rotary action not registering correctly. SparkFun is aware of these issues.*

R8 (2cafc4d)
^^^^^^^^^^^^
* IS: J2901 (Connector for epaper) Pin 10 (Reset) connected to +3.3V via R2902 (100k ohm)
* SHOULD BE: J2901 Pin 10 connected to U2801 Pin 48 (GPIO25_LED aka TP5)

*Note: This replaces R6 in its entirety.*

