#!/bin/bash

echo '#include'' "Arduino.h"'  > prueba

cd my_blink
touch main.c

echo '#include <Arduino.h>' > main.c

cat my_blink.ino >> main.c

avr-gcc -g -Os -mmcu=atmega328p -c main.c
avr-gcc -g -mmcu=atmega328p -o main.elf main.o
avr-objcopy -j .text -j .data -O ihex main.elf main.hex
avr-objcopy -O ihex -R .eeprom main.elf main.hex



