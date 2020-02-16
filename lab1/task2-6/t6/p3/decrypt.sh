echo "bef65565572ccee2a9f9553154ed9498" > C1
#openssl enc -aes-128-cbc -d -in C1 -out out.txt\
#        -K  00112233445566778899aabbccddeeff \
#        -iv 31323334353637383930313233343536
cat C1 | openssl enc -aes-128-cbc -d -out out.txt -K 00112233445566778899aabbccddeeff -iv 31323334353637383930313233343536
