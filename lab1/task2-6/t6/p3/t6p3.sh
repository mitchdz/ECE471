#!/usr/bin/bash

KEY="00112233445566778899aabbccddeeff"
IV="31323334353637383930313233343536"

HEXCOMMAND="xxd -p"

echo "C1     : bef65565572ccee2a9f9553154ed9498"

declare -a arr=("No" "no" "NO" "Yes" "YEs" "yes" "YES")

for i in "${arr[@]}"
do
	echo "${i}" > ${i}
	openssl enc -aes-128-cbc -e -a -in ${i} -out ${i}.bin -K  ${KEY} -iv ${IV}
	printf "${i}.bin : "; ${HEXCOMMAND} ${i}.bin
done

echo "bef65565572ccee2a9f9553154ed9498" > C1
openssl enc -aes-128-cbc -d -a -in C1 -out P1 -K ${KEY} -iv ${IV}

