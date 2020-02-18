import csv
#import pycryptodome

from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad

input_file = 'data/C'


P="255044462d312e350a25d0d4c5d80a34"
IV="09080706050403020100A2B2C2D2E2F2"

with open('out/possibleKeys.txt') as csvfile:
	reader = csv.DictReader(csvfile)
	for row in reader:
		epoch = row['epoch']
		K = row['key']

		file_in = open(input_file, 'rb')
		ciphered_data = file_in.read()
		file_in.close()

		cipher = AES.new(K, AES.MODE_CBC, iv=IV)
		original_data = unpad(cipher.decrypt(ciphered_data), AES.block_size)

		print(original_data)
