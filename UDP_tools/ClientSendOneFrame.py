#!/usr/bin/python
import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
# optional - reuse address / sockets
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
# send to Server IP on desired Port
sock.sendto("HelloWorld", ("10.0.0.1",4210))

