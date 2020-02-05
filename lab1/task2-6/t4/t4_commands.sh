KEY="00112233445566778889aabbccddeeff"
IV="01020304050607081234123412341212"
enc_prefix="openssl enc -aes-128-"

mkdir -p cipher/
mkdir -p plain/

#encrypting
${enc_prefix}ecb -e -in f1.txt -out cipher/f1_ecb_cipher.txt -K ${KEY}
${enc_prefix}ecb -e -in f2.txt -out cipher/f2_ecb_cipher.txt -K ${KEY}
${enc_prefix}ecb -e -in f3.txt -out cipher/f3_ecb_cipher.txt -K ${KEY}
${enc_prefix}cbc -e -in f1.txt -out cipher/f1_cbc_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}cbc -e -in f2.txt -out cipher/f2_cbc_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}cbc -e -in f3.txt -out cipher/f3_cbc_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}cfb -e -in f1.txt -out cipher/f1_cfb_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}cfb -e -in f2.txt -out cipher/f2_cfb_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}cfb -e -in f3.txt -out cipher/f3_cfb_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -e -in f1.txt -out cipher/f1_ofb_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -e -in f2.txt -out cipher/f2_ofb_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -e -in f3.txt -out cipher/f3_ofb_cipher.txt -K ${KEY} -iv ${IV}
#decrypting
${enc_prefix}ecb -d -nopad -in cipher/f1_ecb_cipher.txt -out plain/f1_ecb_plain.txt -K ${KEY}
${enc_prefix}ecb -d -nopad -in cipher/f1_cbc_cipher.txt -out plain/f1_cbc_plain.txt -K ${KEY}
${enc_prefix}cfb -d -nopad -in cipher/f1_cfb_cipher.txt -out plain/f1_cfb_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -d -nopad -in cipher/f1_ofb_cipher.txt -out plain/f1_ofb_plain.txt -K ${KEY} -iv ${IV}

${enc_prefix}ecb -d -nopad -in cipher/f2_ecb_cipher.txt -out plain/f2_ecb_plain.txt -K ${KEY}
${enc_prefix}cbc -d -nopad -in cipher/f2_cbc_cipher.txt -out plain/f2_cbc_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}cfb -d -nopad -in cipher/f2_cfb_cipher.txt -out plain/f2_cfb_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -d -nopad -in cipher/f2_ofb_cipher.txt -out plain/f2_ofb_plain.txt -K ${KEY} -iv ${IV}

${enc_prefix}ecb -d -nopad -in cipher/f3_ecb_cipher.txt -out plain/f3_ecb_plain.txt -K ${KEY}
${enc_prefix}cbc -d -nopad -in cipher/f3_cbc_cipher.txt -out plain/f3_cbc_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}cfb -d -nopad -in cipher/f3_cfb_cipher.txt -out plain/f3_cfb_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -d -nopad -in cipher/f3_ofb_cipher.txt -out plain/f3_ofb_plain.txt -K ${KEY} -iv ${IV}

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




