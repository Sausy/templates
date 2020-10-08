#import usb
import usb.core
import usb.util
import usb.backend.libusb1
import time

VENDOR_ID = 0x28DE
PRODUCT_ID = 0x2101
iManufacturer = 'Valve Software'

interfaceSelect = 0
#if we would have multiple usbs of the same vendor we would need a selector

device = usb.core.find(idVendor=VENDOR_ID, idProduct=PRODUCT_ID)

if device is None:
	raise ValueError("Device not found")
	sys.exit(1)

device.detach_kernel_driver(interfaceSelect)

print("[Start] claiming interface")
usb.util.claim_interface(device, interfaceSelect)
print("[Done] claimed interface sucessfully")
#data = read_from
print("[Start] Find the address to read data (default 0x81)")
print("search for bEndpointAddress\n")
print(device)

cfg = device.get_active_configuration()
intf = cfg[(0,0)]

ep_out = usb.util.find_descriptor(intf, custom_match = lambda e: usb.util.endpoint_direction(e.bEndpointAddress) == usb.util.ENDPOINT_OUT)
ep_in = usb.util.find_descriptor(intf, custom_match = lambda e: usb.util.endpoint_direction(e.bEndpointAddress) == usb.util.ENDPOINT_IN)
#assert ep is not None
print("\n===========\n===[FOUND DEVICE INFO]====\n The Endpoints of this device are")

print(ep_out)
print(ep_in)
time.sleep(3)
print("rdy to stop")
time.sleep(5)


'''
there are 8 std messages defined
bmRequestType	bRequest		wValue		wIndex		wLength	Data
1000 0001b	GET_STATUS (0x00)	Zero		Interface	Two	Interface Status
0000 0001b	CLEAR_FEATURE (0x01)	Feature/Select 	Interface	Zero	None
0000 0001b	SET_FEATURE (0x03)	Feature/Select	Interface	Zero	None
1000 0001b	GET_INTERFACE (0x0A)	Zero		Interface	One	Alternate/Interface
0000 0001b	SET_INTERFACE (0x11)	Alternative/Setting	Interface Zero	None
'''

#=======================================================================
'''
just in case wake up the device via interrupt
on address 0x81, loop up the endpoint address could be different
'''
#print("Wake UP")
#ep_in.read(0,'')
#print("Wake UP OUT")
#ep_out.write('')
#device.write(0x81, 0)

print("Send first URB contrl msg")

'''
0000   c0 10 6b 9e dc 92 ff ff 53 02 00 46 01 00 00 00
0010   88 ce 7e 5f 00 00 00 00 d0 e8 03 00 8d ff ff ff
0020   40 00 00 00 40 00 00 00 21 09 ff 03 00 00 40 00
0030   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0040   ff 96 10 be 5b 32 54 11 cf 83 75 53 8a 08 6a 53
0050   58 d0 b1 00 00 00 00 00 00 00 00 00 00 00 00 00
0060   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0070   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000   40 98 6b 91 dc 92 ff ff 53 02 00 57 01 00 00 00   @.k.Ü.ÿÿS..W....
0010   71 de 7e 5f 00 00 00 00 84 b7 0a 00 8d ff ff ff   qÞ~_.....·...ÿÿÿ
0020   40 00 00 00 40 00 00 00 21 09 ff 03 00 00 40 00   @...@...!.ÿ...@.
0030   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
0040   ff 96 10 be 5b 32 54 11 cf 83 75 53 8a 08 6a 53   ÿ..¾[2T.Ï.uS..jS
0050   58 d0 b1 00 00 00 00 00 00 00 00 00 00 00 00 00   XÐ±.............
0060   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
0070   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
'''

data_raw  = "ff 96 10 be 5b 32 54 11 cf 83 75 53 8a 08 6a 53".split()
data_raw = data_raw + "58 d0 b1 00 00 00 00 00 00 00 00 00 00 00 00 00".split()
data_raw = data_raw + "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()
data_raw = data_raw + "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()

data_out = tuple()
for i in data_raw:
    data_out = data_out + (int(i,16),)

time.sleep(1)
ret_ = 0
print(data_out)
#ret_ = device.ctrl_transfer(0x21, 0x09, 0x03ff, 0, data_out)
ret_ = device.ctrl_transfer(0x21, 0x09, 0x03ff, 0, data_out)

print("rdy to stop")
time.sleep(5)



time.sleep(1)
#print("stage debug")

#ret_ = device.ctrl_transfer(0xa1,1,0x200,0,64)
print(ret_)

print("stage 2")

'''
0000   c0 10 6b 9e dc 92 ff ff 53 02 80 46 01 00 00 3c
0010   88 ce 7e 5f 00 00 00 00 ea ea 03 00 8d ff ff ff
0020   41 00 00 00 00 00 00 00 a1 01 05 03 00 00 41 00
0030   00 00 00 00 00 00 00 00 00 02 00 00 00 00 00 00
'''
data_out  = 0
print("0xa1, data out will be replaced with wLength")
wLength = 0x41
data_out = wLength
for cnt in range(29):
    try:
        ret_ = device.ctrl_transfer(0xa1, 0x01, 0x0305, 0, data_out)
        print(ret_)
        #time.sleep(1)
    except:
        print("0xa1 failed")

'''
try:
    ret_ = device.read(0x80,1)
    print(ret_)
except:
    print("read failed")
'''
print("stage 3")
'''

0x80,0x6a,0x85,0x65 dd 92 ff ff 53 02 00 3f 01 00 00 00   .j.eÝ.ÿÿS..?....
0010   4f f9 7d 5f 00 00 00 00 e3 ef 07 00 8d ff ff ff   Où}_....ãï...ÿÿÿ
0020   40 00 00 00 40 00 00 00 21 09 ff 03 00 00 40 00   @...@...!.ÿ...@.
0030   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
0040   ff a1 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ÿ¡..............
0050   00 10 ba b0 14 b6 7f 00 00 56 40 2c 1a b6 7f 00   ..º°.¶...V@,.¶..
0060   00 04 00 00 00 01 00 00 00 c8 ba b0 14 b6 7f 00   .........Èº°.¶..
0070   00 20 ba b0 14 b6 7f 00 00 56 7b 42 00 00 00 00   . º°.¶...V{B....
'''

data_raw = "ff a1 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()
data_raw = data_raw + "00 10 ba b0 14 b6 7f 00 00 56 40 2c 1a b6 7f 00".split()
data_raw = data_raw + "00 04 00 00 00 01 00 00 00 c8 ba b0 14 b6 7f 00".split()
data_raw = data_raw + "00 20 ba b0 14 b6 7f 00 00 56 7b 42 00 00 00 00".split()

data_out = tuple()
for i in data_raw:
    data_out = data_out + (int(i,16),)

for i in range(4):
    ret_ = device.ctrl_transfer(0x21, 0x09, 0x03ff, 0, data_out)
    print(ret_)
    time.sleep(1)

for i in range(5):
    try:
        ret_ = device.read(0x81,1)
        print(ret_)
    except:
        print("sensor readout failed")


#assert device.ctrl_transfer(0x08, 0x06, 0x0100, 0, 0) == 18

#assert device.ctrl_transfer(0x40, CTRL_LOOPBACK_WRITE, 0, 0, msg) == len(msg)
#ret = device.ctrl_transfer(0xC0, CTRL_LOOPBACK_READ, 0, 0, len(msg))
#sret = ''.join([chr(x) for x in ret])
#assert sret == msg

#assert len(device.write(1, msg, 100)) == len(msg)
# In order to read the pixel bytes, reset PIX_GRAB by sending a write command
'''
response = device.ctrl_transfer(bmRequestType = 0x40, #Write
                                     bRequest = 0x01,
                                     wValue = 0x0000,
                                     wIndex = 0x0D, #PIX_GRAB register value
                                     data_or_wLength = None
                                     )

# Read all the pixels (360 in this chip)
pixList = []
for i in range(361):
    response = device.ctrl_transfer(bmRequestType = 0xC0, #Read
                                         bRequest = 0x01,
                                         wValue = 0x0000,
                                         wIndex = 0x0D, #PIX_GRAB register value
                                         data_or_wLength = 1
                                         )
    pixList.append(response)

print(response)
'''

#ret = device.read(0x81, len(msg), 100)

#print(ret)

usb.util.release_interface(device, interfaceSelect)
print("[Done] interface was released")

device.attach_kernel_driver(interfaceSelect)



