#!/usr/bin/python
import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
# optional - reuse address / sockets
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
# bind to host "" (any) and port 6666
sock.bind(("", 8000))

while True:
    msg, addr = sock.recvfrom(1024)
    print "%s: %s" % (addr, msg)
    sock.sendto("echo: " + msg, addr)
