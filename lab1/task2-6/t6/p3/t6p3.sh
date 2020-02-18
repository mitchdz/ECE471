#!/usr/bin/bash

KEY="00112233445566778899aabbccddeeff"
IV="31323334353637383930313233343536"

HEXCOMMAND="xxd -p"

echo "C1     : bef65565572ccee2a9f9553154ed9498"

declare -a arr=("No" "no" "NO" "Yes" "YEs" "yes" "YES")

for i in "${arr[@]}"
do
	echo "${i}" > ${i}
	openssl enc -aes-128-cbc -e -a -in ${i} -out ${i}.bin -K  ${KEY} -iv ${IV} -nosalt -nopad
	printf "${i}.bin : "; ${HEXCOMMAND} ${i}.bin
done

#626566363535363535373263636565326139663935353331353465643934
#39380a

#echo "bef65565572ccee2a9f9553154ed9498" > C1
#echo "62656636353536353537326363656532613966393535333135346564393439380a" | openssl enc -aes-128-cbc -d -out P1 -K ${KEY} -iv ${IV} -nopad -nosalt
#xxd P1
