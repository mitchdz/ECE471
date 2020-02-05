#encrypting files with ECB, CBC, CFB, and OFB

#ECB
openssl enc -aes-128-ecb -e -in f1.txt -out f1_ecb_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212
openssl enc -aes-128-ecb -e -in f2.txt -out f2_ecb_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212
openssl enc -aes-128-ecb -e -in f3.txt -out f3_ecb_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212

#CBC
openssl enc -aes-128-cbc -e -in f1.txt -out f1_cbc_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212
openssl enc -aes-128-cbc -e -in f2.txt -out f2_cbc_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212
openssl enc -aes-128-cbc -e -in f3.txt -out f3_cbc_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212

#CFB
openssl enc -aes-128-cfb -e -in f1.txt -out f1_cfb_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212
openssl enc -aes-128-cfb -e -in f2.txt -out f2_cfb_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212
openssl enc -aes-128-cfb -e -in f3.txt -out f3_cfb_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212

#OFB
openssl enc -aes-128-ofb -e -in f1.txt -out f1_ofb_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212
openssl enc -aes-128-ofb -e -in f2.txt -out f2_ofb_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212
openssl enc -aes-128-ofb -e -in f3.txt -out f3_ofb_cipher.txt -K 00112233445566778889aabbccddeeff -iv 01020304050607081234123412341212

