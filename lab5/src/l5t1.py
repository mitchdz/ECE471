#!/usr/bin/python
import os
os.sys.path.append('/usr/bin/')
from scapy.all import *

def print_pkt (pkt):
    pkt.show()

pkt = sniff(filter='icmp',prn=print_pkt)
