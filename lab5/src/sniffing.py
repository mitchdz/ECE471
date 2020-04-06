#!/usr/bin/python
from scapy.all import *

def print_pkt(pkt):
	pkt.show()

pkt = sniff(filter='icmp',prn=print_pkt)

if __name__ == "__main__":
    # execute only if run as a script
    print_pkt(pkt)
