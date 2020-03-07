START="4192"
END=$(($START + 129))

head -c ${START} a.out > prefix
md5collgen -p prefix -o out1 out2
tail -c +${END} a.out > suffixtemp

head -c 8 suffixtemp > arrtemp
cat out1 arrtemp > out1arr
cat out2 arrtemp > out2arr
tail -c +9 suffixtemp > suffix

tail -c +25 suffix > suffixtemp
head -c 24 suffix > buffer
cat out1arr buffer > file1buffer
cat out2arr buffer > file2buffer

tail -c +201 suffixtemp > suffix
tail -c +4161 out1arr > comparray
cat file1buffer comparray suffix > goodCode
cat file2buffer comparray suffix > maliciousCode

md5sum goodCode maliciousCode
chmod +x goodCode
chmod +x maliciousCode

./goodCode
./maliciousCode
