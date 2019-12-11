#!/bin/bash

result=$(curl -v -H 'Content-Type: multipart/form-data' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,/;q=0.8' -d "version[changelog]=cambios_asd&version[program_name]=Blinky" -X POST http://tobyteam.computerengineering.me/versions)

idversion=$(echo $result | cut -d "," -f 2)