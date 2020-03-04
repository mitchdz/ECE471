head -c 12320 a.out > a_pre
tail -c +12512 a.out > a_suf
cat a_pre out1.bin a_suf > manu_1
cat a_pre out2.bin a_suf > manu_2
md5sum manu_1 manu_2
