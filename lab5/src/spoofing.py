#!/usr/bin/python
from scapy.all import *

def print_pkt(pkt):
	pkt.show()
	a=IP(dst=pkt[IP].src)/ICMP)
	sr1(a)

pkt = sniff(filter='icmp',prn=print_pkt)
