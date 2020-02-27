echo "hello!" > prefix.txt
md5collgen -p prefix.txt -o out1.bin out2.bin
echo "T" > T
cat out1.bin T > T1
cat out2.bin T > T2
