# Wordmatrix

We create our first prototype of a wordmatrix.

To do so, we build an LEDMatrix which will be controlled by the esp8266.
Then we light different words in the 3d printed wordmask.

## 💾 Compatible hardware

- esp8266

## ⚡ Flash firmware

- install [esptool.py](https://github.com/espressif/esptool), or [something else](https://nodemcu.readthedocs.io/en/release/flash)
- sudo esptool.py --port /dev/ttyUSB0 write_flash 0x0 firmware/nodemcu-release-11-modules-2022-08-20-09-04-40-float.bin

Or [build it yourself](https://nodemcu.readthedocs.io/en/release/build) with the following modules:

- color_utils
- file
- gpio
- net
- node
- pixbuf
- sjson
- tmr
- uart
- ws2812
- ws2812_effects

We recommend [nodemcu-build.com](https://nodemcu-build.com) for building.

## 💡 Upload program

- install [NodeMCU-Tool](https://github.com/AndiDittrich/NodeMCU-Tool), or [something else](https://nodemcu.readthedocs.io/en/release/upload)
- sudo ./flash/flash.sh

## 3rd party

We used [Black Ops One](https://fonts.google.com/specimen/Black+Ops+One) as font for the word plates.
