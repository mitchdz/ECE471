#!/usr/bin/bash
KEY="00112233445566778889aabbccddeeff"
IV="01020304050607081234123412341212"
ENC_PREF="openssl enc -aes-128-"

CIPHER_PREF="cipher"
PLAIN_PREF="plain"
mkdir -p ${CIPHER_PREF}/
mkdir -p ${PLAIN_PREF}/

#encrypting
${ENC_PREF}ecb -e -in f1.txt -out ${CIPHER_PREF}/f1_ecb_cipher.txt -K ${KEY}
${ENC_PREF}ecb -e -in f2.txt -out ${CIPHER_PREF}/f2_ecb_cipher.txt -K ${KEY}
${ENC_PREF}ecb -e -in f3.txt -out ${CIPHER_PREF}/f3_ecb_cipher.txt -K ${KEY}
${ENC_PREF}cbc -e -in f1.txt -out ${CIPHER_PREF}/f1_cbc_cipher.txt -K ${KEY} \
    -iv ${IV}
${ENC_PREF}cbc -e -in f2.txt -out ${CIPHER_PREF}/f2_cbc_cipher.txt -K ${KEY} \
    -iv ${IV}
${ENC_PREF}cbc -e -in f3.txt -out ${CIPHER_PREF}/f3_cbc_cipher.txt -K ${KEY} \
    -iv ${IV}
${ENC_PREF}cfb -e -in f1.txt -out ${CIPHER_PREF}/f1_cfb_cipher.txt -K ${KEY} \
    -iv ${IV}
${ENC_PREF}cfb -e -in f2.txt -out ${CIPHER_PREF}/f2_cfb_cipher.txt -K ${KEY} \
    -iv ${IV}
${ENC_PREF}cfb -e -in f3.txt -out ${CIPHER_PREF}/f3_cfb_cipher.txt -K ${KEY} \
    -iv ${IV}
${ENC_PREF}ofb -e -in f1.txt -out ${CIPHER_PREF}/f1_ofb_cipher.txt -K ${KEY} \
    -iv ${IV}
${ENC_PREF}ofb -e -in f2.txt -out ${CIPHER_PREF}/f2_ofb_cipher.txt -K ${KEY} \
    -iv ${IV}
${ENC_PREF}ofb -e -in f3.txt -out ${CIPHER_PREF}/f3_ofb_cipher.txt -K ${KEY} \
    -iv ${IV}
#decrypting
${ENC_PREF}ecb -d -nopad -in ${CIPHER_PREF}/f1_ecb_cipher.txt \
    -out ${PLAIN_PREF}/f1_ecb_plain.txt -K ${KEY}
${ENC_PREF}ecb -d -nopad -in ${CIPHER_PREF}/f1_cbc_cipher.txt \
    -out ${PLAIN_PREF}/f1_cbc_plain.txt -K ${KEY}
${ENC_PREF}cfb -d -nopad -in ${CIPHER_PREF}/f1_cfb_cipher.txt \
    -out ${PLAIN_PREF}/f1_cfb_plain.txt -K ${KEY} -iv ${IV}
${ENC_PREF}ofb -d -nopad -in ${CIPHER_PREF}/f1_ofb_cipher.txt \
    -out ${PLAIN_PREF}/f1_ofb_plain.txt -K ${KEY} -iv ${IV}

${ENC_PREF}ecb -d -nopad -in ${CIPHER_PREF}/f2_ecb_cipher.txt \
    -out ${PLAIN_PREF}/f2_ecb_plain.txt -K ${KEY}
${ENC_PREF}cbc -d -nopad -in ${CIPHER_PREF}/f2_cbc_cipher.txt \
    -out ${PLAIN_PREF}/f2_cbc_plain.txt -K ${KEY} -iv ${IV}
${ENC_PREF}cfb -d -nopad -in ${CIPHER_PREF}/f2_cfb_cipher.txt \
    -out ${PLAIN_PREF}/f2_cfb_plain.txt -K ${KEY} -iv ${IV}
${ENC_PREF}ofb -d -nopad -in ${CIPHER_PREF}/f2_ofb_cipher.txt \
    -out ${PLAIN_PREF}/f2_ofb_plain.txt -K ${KEY} -iv ${IV}

${ENC_PREF}ecb -d -nopad -in ${CIPHER_PREF}/f3_ecb_cipher.txt \
    -out ${PLAIN_PREF}/f3_ecb_plain.txt -K ${KEY}
${ENC_PREF}cbc -d -nopad -in ${CIPHER_PREF}/f3_cbc_cipher.txt \
    -out ${PLAIN_PREF}/f3_cbc_plain.txt -K ${KEY} -iv ${IV}
${ENC_PREF}cfb -d -nopad -in ${CIPHER_PREF}/f3_cfb_cipher.txt \
    -out ${PLAIN_PREF}/f3_cfb_plain.txt -K ${KEY} -iv ${IV}
${ENC_PREF}ofb -d -nopad -in ${CIPHER_PREF}/f3_ofb_cipher.txt \
    -out ${PLAIN_PREF}/f3_ofb_plain.txt -K ${KEY} -iv ${IV}

#printing out results
echo "f1.txt"
printf "plain: "; xxd f1.txt
printf "ecb  : "; xxd plain/f1_ecb_plain.txt
printf "cbc  : "; xxd plain/f1_cbc_plain.txt
printf "cfb  : "; xxd plain/f1_cfb_plain.txt
printf "ofb  : "; xxd plain/f1_ofb_plain.txt

echo ""
echo "f2.txt"
printf "plain: "; xxd f2.txt
printf "ecb  : "; xxd plain/f2_ecb_plain.txt
printf "cbc  : "; xxd plain/f2_cbc_plain.txt
printf "cfb  : "; xxd plain/f2_cfb_plain.txt
printf "ofb  : "; xxd plain/f2_ofb_plain.txt

echo ""
echo "f3.txt"
printf "plain: "; xxd f3.txt
printf "ecb  : "; xxd plain/f3_ecb_plain.txt
printf "cbc  : "; xxd plain/f3_cbc_plain.txt
printf "cfb  : "; xxd plain/f3_cfb_plain.txt
printf "ofb  : "; xxd plain/f3_ofb_plain.txt
