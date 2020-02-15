#!/usr/bin/bash

KEY="00112233445566778899aabbccddeeff"
IV="31323334353637383930313233343536"

HEXCOMMAND="xxd -p"

echo "C1     : bef65565572ccee2a9f9553154ed9498"

echo "No" > No
openssl enc -aes-128-cbc -e -in No -out No.bin -K  ${KEY} -iv ${IV}
printf "No.bin : "; ${HEXCOMMAND} No.bin

echo "no" > no
openssl enc -aes-128-cbc -e -in no -out no.bin -K ${KEY} -iv ${IV}
printf "no.bin : "; ${HEXCOMMAND} no.bin

echo "Yes" > Yes
openssl enc -aes-128-cbc -e -in Yes -out Yes.bin -K ${KEY} -iv ${IV}
printf "Yes.bin: "; ${HEXCOMMAND} Yes.bin

echo "yes" > yes
openssl enc -aes-128-cbc -e -in yes -out yes.bin -K ${KEY} -iv ${IV}
printf "yes.bin: "; ${HEXCOMMAND} yes.bin

echo "bef65565572ccee2a9f9553154ed9498" > C1
openssl enc -aes-128-cbc -d -in C1 -out P1 -K ${KEY} -iv ${IV}


