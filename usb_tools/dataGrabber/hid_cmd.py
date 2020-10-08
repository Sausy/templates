import usb.core
import usb.util
import usb.backend.libusb1
import time

def tool_rawToTuple(raw):
    data_out = tuple()
    print(raw)
    for i in raw:
        data_out = data_out + (int(i,16),)
    return data_out
    
def getDescriptor(dev):
    print("request Device")
    ret_ = dev.ctrl_transfer(0x80, 0x06, 0x0100, 0, 0x28)
    print(ret_)
    time.sleep(1)

def initInterrup(endpoint):
    print("pushout Interrupt")
    print("try till sucess")
    for cnt in range(2):
        try:
            endpoint.write('')
            break
        except:
            print("ISR error ")
    #ret_ = endpoint.read('')
    #print(ret_)

def writeCmd(dev):
    data_raw  = "ff 96 10 be 5b 32 54 11 cf 83 75 53 8a 08 6a 53".split()
    data_raw = data_raw + "58 d0 b1 00 00 00 00 00 00 00 00 00 00 00 00 00".split()
    data_raw = data_raw + "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()
    data_raw = data_raw + "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()

    #print("printing raw data \n {} ".format(data_raw))

    
    data_out = tool_rawToTuple(data_raw)
    #print(data_out)

    for cnt in range(10):
        try:
            #endpoint.write('')
            ret_ = dev.ctrl_transfer(0x21, 0x09, 0x03ff, 0, data_out)
            break
        except:
            print("first cmd was a NOPE")

    max_counter = 200
    cnt = 0
    for cnt in range(5):
        #time.sleep(0.03)
        try:
            ret_ = device.ctrl_transfer(0xa1, 0x01, 0x0305, 0, 0x41)
            print(ret_)
            #break
        except:
            #cnt = cnt + 1
            print("0xa1 failed")
#        if cnt >= max_counter :
 #           print("TOTAL ERROR")
        
        for cnt2 in range(33):
            try:
                ret_ = device.read(0x81, 59)
                print(ret_)
            except:
                print("nope")


    #ret_ = dev.ctrl_transfer(0x21, 0x09, 0x03ff, 0, data_out)
    #time.sleep(2)
    #dev.ctrl_transfer(0x21, 0x09, 0x03ff, 0, (0xff,0xaa))
    #time.sleep(5)

def initalStuff(dev):
    max_counter = 200
    cnt = 0 
    '''
    for cnt in range(201):
        try:
            ret_ = device.ctrl_transfer(0xa1, 0x01, 0x0305, 0, 0x41)
            print(ret_)
            break
        except:
            cnt = cnt + 1
            #print("0xa1 failed")
        if cnt >= max_counter :
            print("TOTAL ERROR")
    '''


    print("The follwing stuff was captured via wireshark, i have no clue whats going on")
    '''
    0020   40 00 00 00 40 00 00 00 21 09 ff 03 00 00 40 00
    0030   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

    0040   ff 87 06 01 00 00 02 00 00 00 00 00 00 00 00 00
    0050   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0060   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0070   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    '''
    data_raw  = "ff 87 06 01 00 00 02 00 00 00 00 00 00 00 00 00".split()
    data_raw = data_raw + "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()
    data_raw = data_raw + "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()
    data_raw = data_raw + "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()

    data_out = tool_rawToTuple(data_raw)
    ret_ = dev.ctrl_transfer(0x21, 0x09, 0x03ff, 0, data_out)
    print(ret_)

    '''
    0000   40 88 72 63 dd 92 ff ff 53 02 00 5a 01 00 00 00
    0010   a9 25 7f 5f 00 00 00 00 50 c9 02 00 8d ff ff ff
    0020   40 00 00 00 40 00 00 00 21 09 ff 03 00 00 40 00
    0030   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

    0040   ff 83 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0050   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0060   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0070   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    '''

    data_raw  = "ff 83 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()
    data_raw = data_raw + "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()
    data_raw = data_raw + "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()
    data_raw = data_raw + "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00".split()
    
    time.sleep(1)

    data_out = tool_rawToTuple(data_raw)
    ret_ = dev.ctrl_transfer(0x21, 0x09, 0x03ff, 0, data_out)
    print(ret_)

    '''
    0000   40 88 72 63 dd 92 ff ff 53 02 80 5a 01 00 00 3c
    0010   a9 25 7f 5f 00 00 00 00 35 cb 02 00 8d ff ff ff
    0020   41 00 00 00 00 00 00 00 a1 01 ff 03 00 00 41 00
    0030   00 00 00 00 00 00 00 00 00 02 00 00 00 00 00 00

    hence => a1 01 ff 03 00 00 41 00
    '''
    
    #cnt = 0
    for cnt in range(40):
        try:
            ret_ = device.ctrl_transfer(0xa1, 0x01, 0x0305, 0, data_out)
            print(ret_)
            break
        except:
            #cnt = cnt + 1
            print("0xa1 failed")
        #if cnt >= max_counter :
        #    print("TOTAL ERROR")



def keepAlive(dev):
    '''
    0000   40 88 72 63 dd 92 ff ff 53 02 80 5a 01 00 00 3c
    0010   a9 25 7f 5f 00 00 00 00 35 cb 02 00 8d ff ff ff
    0020   41 00 00 00 00 00 00 00 a1 01 ff 03 00 00 41 00
    0030   00 00 00 00 00 00 00 00 00 02 00 00 00 00 00 00
    '''
    for cnt in range(29):
        try:
            ret_ = device.ctrl_transfer(0xa1, 0x01, 0x0305, 0, data_out)
            print(ret_)
        except:
            print("0xa1 failed")



VENDOR_ID = 0x28DE
PRODUCT_ID = 0x2101
iManufacturer = 'Valve Software'

interfaceSelect = 0

device = usb.core.find(idVendor=VENDOR_ID, idProduct=PRODUCT_ID)

if device is None:
        raise ValueError("Device not found")
        sys.exit(1)

device.detach_kernel_driver(interfaceSelect)
usb.util.claim_interface(device, interfaceSelect)

cfg = device.get_active_configuration()
intf = cfg[(0,0)]

print(intf)

ep_out = usb.util.find_descriptor(intf, custom_match = lambda e: usb.util.endpoint_direction(e.bEndpointAddress) == usb.util.ENDPOINT_OUT)
ep_in = usb.util.find_descriptor(intf, custom_match = lambda e: usb.util.endpoint_direction(e.bEndpointAddress) == usb.util.ENDPOINT_IN)

#initInterrupt(ep_in)

print("rdy to stop")
#time.sleep(5)

#initInterrup(ep_in)
getDescriptor(device)

#initInterrup(ep_out)
#time.sleep(1)
initInterrup(ep_in)
#time.sleep(10)

writeCmd(device)
#initalStuff(device)

time.sleep(10)
print("done")
time.sleep(6)


usb.util.release_interface(device, interfaceSelect)
device.attach_kernel_driver(interfaceSelect)


