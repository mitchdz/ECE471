import csv
from Crypto.Cipher import AES
import Crypto.Cipher.AES
from binascii import hexlify, unhexlify

import codecs

C  = unhexlify("d06bf9d0dab8e8ef880660d2af65aa82")
P  = unhexlify("255044462d312e350a25d0d4c5d80a34")
IV = unhexlify("09080706050403020100A2B2C2D2E2F2")

with open('out/keys.csv') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        epoch = row['epoch']
        K = unhexlify(row['key'])
        decipher = AES.new(K, AES.MODE_CBC, IV)
        plaintext = hexlify(decipher.decrypt(C))
        print(hexlify(K), "-> ", plaintext)
        if (plaintext == P):
            print("GOT EM: " + key)
