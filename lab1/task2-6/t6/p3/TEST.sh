#!/usr/bin/bash
KEY="00112233445566778899aabbccddeeff"
IV1="31323334353637383930313233343536"
IV2="31323334353637383930313233343537"

HEXCOMMAND="xxd -p"

echo "596572" | openssl enc -e -aes-128-cbc -K ${KEY} -iv ${IV2} -out out_TEST
openssl enc -d -nopad -aes-128-cbc -K ${KEY} -iv ${IV2} -out out_TEST1
cat out_TEST1 | openssl enc -e -aes-128-cbc -K ${KEY} -iv ${IV2} -out out_TEST2
xxd out_TEST2


