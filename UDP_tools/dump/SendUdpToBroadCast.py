#!/usr/bin/python
import socket
import time
'''
A IPv4 network has a broadcast adress that is network depending
sock.bind(("", 8000)) ... with this comand u can listen to that address
'''
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
msg = raw_input("Message: ")
#sock.bind(("", 8000)) #set to "" for broadcast adress
sock.bind(("",8000))

#print("sock bind to 8000")
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
#sock.sendto(msg, ("", 8000)) 
#time.sleep(2)
sock.sendto(msg, ("",8000)) #set to listening adress
print "Reply:", sock.recvfrom(1024)[0]

print ("printing data to esp")
cmdPort = 4210
arduinoIP = "192.168.0.30"
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
msg = "192.168.0.31"
#sock.bind(("", 8000)) #set to "" for broadcast adress
#sock.bind((arduinoIP,cmdPort))
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
#sock.sendto(msg, ("", 8000)) 
sock.sendto(msg, (arduinoIP,cmdPort)) #set to listening adress
print "Reply:", sock.recvfrom(1024)[0]
'''
