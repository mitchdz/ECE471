P="255044462d312e350a25d0d4c5d80a34"
IV="09080706050403020100A2B2C2D2E2F2"


OUTPUT=`openssl enc -aes-128-cbc -d -in CHex -K 00112233445566778899aabbccddeeff -iv 31323334353637383930313233343536 -nosalt -nopad | xxd -p`

echo "RESULT: ${OUTPUT}"


#input="out/possibleKeys.txt"
#while IFS=',' read -r epoch K
#do
#	OUTPUT=`openssl enc -aes-128-cbc -d -in data/C -K ${K} -iv ${IV} -nosalt -nopad | xxd -p`
#
#	echo "${K},${OUTPUT}"
#	if [ "$OUTPUT" == "$P" ]
#		then
#			echo "HIT! KEY: ${K}"
#			break
#	fi
#done < "$input"
