d -c 4224 a.out > prefix
md5collgen -p prefix -o P Q
tail -c +4352 a.out > suffix
cat P suffix > new1
cat Q suffix > new2
md5sum new1 new2
chmod +x new1
chmod +x new2
echo $(./new1) | md5sum
echo $(./new2) | md5sum


