#!/bin/sh

nodemcu-tool upload init.lua
nodemcu-tool upload words.json
nodemcu-tool upload lib/LedMatrix.lua
nodemcu-tool upload lib/Matrix.lua
