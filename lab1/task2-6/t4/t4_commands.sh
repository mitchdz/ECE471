KEY="00112233445566778889aabbccddeeff"
IV="01020304050607081234123412341212"
enc_prefix="openssl enc -aes-128-"

#encrypting
${enc_prefix}ecb -e -in f1.txt -out f1_ecb_cipher.txt -K ${KEY}
${enc_prefix}ecb -e -in f2.txt -out f2_ecb_cipher.txt -K ${KEY}
${enc_prefix}ecb -e -in f3.txt -out f3_ecb_cipher.txt -K ${KEY}
${enc_prefix}cbc -e -in f1.txt -out f1_cbc_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}cbc -e -in f2.txt -out f2_cbc_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}cbc -e -in f3.txt -out f3_cbc_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}cfb -e -in f1.txt -out f1_cfb_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}cfb -e -in f2.txt -out f2_cfb_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}cfb -e -in f3.txt -out f3_cfb_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -e -in f1.txt -out f1_ofb_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -e -in f2.txt -out f2_ofb_cipher.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -e -in f3.txt -out f3_ofb_cipher.txt -K ${KEY} -iv ${IV}
#decrypting
${enc_prefix}ecb -d -nopad -in f1_ecb_cipher.txt -out f1_ecb_plain.txt -K ${KEY}
${enc_prefix}ecb -d -nopad -in f2_ecb_cipher.txt -out f2_ecb_plain.txt -K ${KEY}
${enc_prefix}ecb -d -nopad -in f3_ecb_cipher.txt -out f3_ecb_plain.txt -K ${KEY}
${enc_prefix}cbc -d -nopad -in f1_cbc_cipher.txt -out f1_cbc_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}cbc -d -nopad -in f2_cbc_cipher.txt -out f2_cbc_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}cbc -d -nopad -in f3_cbc_cipher.txt -out f3_cbc_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}cfb -d -nopad -in f1_cfb_cipher.txt -out f1_cfb_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}cfb -d -nopad -in f2_cfb_cipher.txt -out f2_cfb_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}cfb -d -nopad -in f3_cfb_cipher.txt -out f3_cfb_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -d -nopad -in f1_ofb_cipher.txt -out f1_ofb_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -d -nopad -in f2_ofb_cipher.txt -out f2_ofb_plain.txt -K ${KEY} -iv ${IV}
${enc_prefix}ofb -d -nopad -in f3_ofb_cipher.txt -out f3_ofb_plain.txt -K ${KEY} -iv ${IV}
