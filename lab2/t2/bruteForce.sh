#!/usr/bin/bash
P="255044462d312e350a25d0d4c5d80a34"
C="d06bf9d0dab8e8ef880660d2af65aa82"
IV="09080706050403020100A2B2C2D2E2F2"
echo "${P}" > P
#echo "${C}" > C
echo "${IV}" > IV

DIR="$(cd "$(dirname "$0")" && pwd)"

# openssl enc -aes-128-cbc -d -in C -K fd89be04ce588454168062267d591d2e -iv 09080706050403020100A2B2C2D2E2F2 -nosalt -nopad


input="out/possibleKeys.txt"
while IFS=',' read -r epoch K
do
	NEWP="$(openssl enc -aes-128-cbc -d -in data/C -K ${K} -iv ${IV} -nosalt -nopad | xxd -p)"
	if [ "$NEWP" == "$P" ]
		then
			echo "HIT! KEY: ${K}"
	fi
done < "$input"




# END=${T2}
# for ((i=${T1};i<=END;i++)); do
# 	#echo "${i} -> ${K}"

# 	NEWP="$(openssl enc -aes-128-cbc -a -d -in C -K ${K} -iv ${IV})"
# 	#echo ${NEWP}

# 	if [ ${NEWP} -eq ${P} ] 
# 		then
# 			echo "HIT!"
# 	fi

# done


