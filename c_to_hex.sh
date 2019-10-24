#!/bin/bash

avr-gcc -g -Os -mmcu=atmega32 -c led.c
avr-gcc -g -mmcu=atmega32 -o led.elf led.o
avr-objcopy -j .text -j .data -O ihex led.elf led.hex

avr-objcopy -O ihex -R .eeprom led.elf led.hex

/home/lihuen/Downloads/arduino-1.8.10/hardware/tools/avr/bin/avrdude -C/home/lihuen/Downloads/arduino-1.8.10/hardware/tools/avr/etc/avrdude.conf -v -patmega328p -carduino -P/dev/ttyACM0 -b115200 -D -Uflash:w:/tmp/arduino_build_260289/my_blink.ino.hex:i 
