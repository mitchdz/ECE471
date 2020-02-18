HEX="bef65565572ccee2a9f9553154ed9498"


echo ${HEX} | sed 's/.\{2\}/&\\x/g'
