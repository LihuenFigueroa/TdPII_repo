#!/bin/bash


# COMPILACION GENERADA CON EXITO Y .HEX LISTO
#############################################

# En el commit me viene program_name#change_log

program_name=$(git log -1 | sed '5!d' | cut -d " " -f 5- | cut -d "#" -f 1)

cd $program_name

touch $program_name'.cpp'

echo "#include <Arduino.h>" > $program_name'.cpp'

cat $program_name'.ino' >> $program_name'.cpp'

cd ..

sed -i "s/MAIN_SKETCH = .*/MAIN_SKETCH = $program_name\/$program_name.cpp/g" makefile

make 

change_log=$(git log -1 | sed '5!d' | cut -d " " -f 5- | cut -d "#" -f 2)

result=$(curl -v -H 'Content-Type: multipart/form-data' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,/;q=0.8' -d "version[changelog]=$change_log&version[program_name]=$program_name" -X POST http://tobyteam.computerengineering.me/versions)

idprogram=$(echo $result | cut -d "," -f 1)
idversion=$(echo $result | cut -d "," -f 2)

# obtengo idprogram
# obtengo idversion
mkdir -p programs
cd programs
mkdir -p $idprogram
cd $idprogram
mkdir -p $idversion
cd ..
mv $program_name/$program_name'.cpp.hex' programs/$idprogram/$idversion/1.hex 
# hardcodeado porque solo es compatible con atmega328p
