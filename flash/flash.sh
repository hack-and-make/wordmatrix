#!/bin/sh

nodemcu-tool upload --port=/dev/tty.usbserial-142420 flash/init.lua
nodemcu-tool upload --port=/dev/tty.usbserial-142420 flash/words.json
