P="255044462d312e350a25d0d4c5d80a34"
IV="09080706050403020100A2B2C2D2E2F2"


input="out/possibleKeys.txt"
while IFS=',' read -r epoch K
do
	OUTPUT=`openssl enc -aes-128-cbc -d -in data/C -K ${K} -iv ${IV} -nosalt -nopad | xxd -p`

	if [ "$OUTPUT" == "$P" ]
		then
			echo "HIT! KEY: ${K}"
	fi
done < "$input"
