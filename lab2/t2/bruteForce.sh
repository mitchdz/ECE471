#!/usr/bin/bash
P="255044462d312e350a25d0d4c5d80a34"
C="d06bf9d0dab8e8ef880660d2af65aa82"
IV="09080706050403020100A2B2C2D2E2F2"
echo "${P}" > P
echo "${C}" > C
echo "${IV}" > IV

T1="1524024529"
T2="1524038929"

KEYGENERATE="${PWD}/generate"

DIR="$(cd "$(dirname "$0")" && pwd)"

END=${T2}
for ((i=${T1};i<=END;i++)); do
	echo "$DIR/generate ${i}"
	echo "${i} -> $($DIR/generate ${i})"

	#NEWP="$(openssl enc -aes-128-cbc -d -in C -K ${KEY} -iv ${IV})"
	#echo NEWP
done


