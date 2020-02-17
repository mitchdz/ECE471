echo "bef65565572ccee2a9f9553154ed9498" > C1

KEY="00112233445566778899aabbccddeeff"
IV="31323334353637383930313233343536"

HEXCOMMAND="xxd -p"

echo "C1     : bef65565572ccee2a9f9553154ed9498"

declare -a arr=( \
	"blake2b512" "blake2s256" "gost" "md4" "md5" "rmd160" "sha1" "sha224" \
	"sha256" "sha3-224" "sha3-256" "sha3-384" "sha3-512" "sha384" "sha512" \
	"sha512-224" "sha512-256" "shake128" "shake256" "sm3" \
)

for i in "${arr[@]}"
do
  openssl enc -aes-128-cbc -d -in C1 -out out.txt -K ${KEY} -iv ${IV} -md ${i}
  printf "${i} : "; ${HEXCOMMAND} out.txt
done

