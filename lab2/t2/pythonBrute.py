import csv
import base64
import hashlib
from Crypto import Random
from Crypto.Cipher import AES


with open('out/possibleKeys.txt') as csvfile:
	reader = csv.DictReader(csvfile)
	for row in reader:
		epoch = row['epoch']
		K = row['key']


		print(row['epoch'] + " " + row['key'])
