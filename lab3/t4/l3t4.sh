#START="16640"
START="4192"
END=$(($START + 129))

head -c ${START} a.out > prefix
md5collgen -p prefix -o out1 out2
tail -c +${END} a.out > suffixtest

head -c 8 suffixtest > arrcomplete
cat out1 arrcomplete > out1arrcomplete
cat out2 arrcomplete > out2arrcomplete
tail -c +9 suffixtest > suffix

tail -c +25 suffix > suffixtest
head -c 24 suffix > tillnext
cat out1arrcomplete tillnext > file1tillnext
cat out2arrcomplete tillnext > file2tillnext

tail -c +201 suffixtest > suffix
tail -c +4161 out1arrcomplete > comparray
cat file1tillnext comparray suffix > firstexec
cat file2tillnext comparray suffix > secondexec

md5sum firstexec secondexec
chmod +x firstexec
chmod +x secondexec

./firstexec
./secondexec
