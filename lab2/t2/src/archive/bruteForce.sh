P="255044462d312e350a25d0d4c5d80a34"
IV="09080706050403020100A2B2C2D2E2F2"

#openssl enc -aes-128-cbc -d -in CHex -K 00112233445566778899aabbccddeeff -iv 31323334353637383930313233343537 -nosalt -nopad | xxd -p

input="out/keys.csv"
while IFS=',' read -r epoch K
do
	#echo "openssl enc -aes-128-cbc -d -in C -K ${K} -iv ${IV} -nosalt -nopad | xxd -p"
	OUTPUT=`openssl enc -aes-128-cbc -d -in C -K ${K} -iv ${IV} -nosalt -nopad | xxd -p`

	echo "${K},${OUTPUT}"
	if [ "$OUTPUT" == "$P" ]
		then
			echo "HIT! KEY: ${K}"
			break
	fi
done < "$input"
