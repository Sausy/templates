import usb.core
import usb.util
import usb.backend.libusb1
import time
import numpy as np
import sys
import copy

frame01 = [[]]
frame02 = [[]]
frameDef= [[]]

#FRAME_ID_IMU = 0x23
#FRAME_ID_LIGHT = 0x24

VIVE_REPORT_INFO = 1
VIVE_REPORT_IMU = 0x20
VIVE_REPORT_USB_TRACKER_LIGHTCAP_V1 = 0x21
VIVE_REPORT_RF_WATCHMAN = 0x23
VIVE_REPORT_RF_WATCHMANx2 = 0x24
VIVE_REPORT_USB_LIGHTCAP_REPORT_V1 = 0x25

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


def pars_light_frame(frame):
    print("fuck off")

stopPos = -1
def writeCmd(dev):
    frame01 = [[]]
    frame02 = [[]]
    stopPos = -1

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
    for cnt in range(20):
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
        
#        rawOut = 
        for cnt2 in range(75):
            rawOut = ""
            try:
                ret_ = device.read(0x81, 59)
                rawDump = str(ret_)
                rawDump = rawDump.replace("array", "")
                rawDump = rawDump.replace("]","")
                rawDump = rawDump.replace("[","")
                rawDump = rawDump.replace("(","")
                rawDump = rawDump.replace(")","")
                rawDump = rawDump.replace("'","")
                rawDump = rawDump.replace(" ","")
                
                #rawOut = int(rawDump.split(','),16)
                rawOut = rawDump.split(',')
                rawOut = rawOut[1:]
                #frame01 = np.append(frame01,[rawOut],axis=0)

                #Only print out Lighthouse Data for debug reasons
                #if rawOut[0] == FRAME_ID_LIGHT:
                #    print(rawOut)
                #print(rawOut)

            except:
                print("nope")
            
            try:
                #foo_ = int(rawOut[0],10)
                #print(VIVE_REPORT_RF_WATCHMANx2)
                if int(rawOut[0],10) == VIVE_REPORT_RF_WATCHMANx2:
                    #print("len raw {}".format(len(rawOut)))
                    #print("len frame01 {}".format(len(frame01)))
                    if np.size(frame01) <= 5:
                        frame01 = [rawOut[1:30]]
                        frame01 = np.append(frame01,[rawOut[30:]], axis=0)
                        #print("len frame01 {}".format(np.size(frame01)))

                        #print(rawOut[3] & 0xe0)
                    else:
                        frame01 = np.append(frame01,[rawOut[1:30]], axis=0)
                        frame01 = np.append(frame01,[rawOut[30:]], axis=0)
                        print(rawOut)
                        foo = int(rawOut[4],10) 
                        print(foo & 0xe0)
                        foo = int(rawOut[33],10)
                        print(foo & 0xe0)
                        
                        stopPos = -1
                        for cnt_ in range(4,29):
                            sRaw = int(rawOut[cnt_],10)
                            #sID = sRaw>>3
                            if sRaw >= 0xc0:
                                print("End of Sensor Data")
                                break
                            else:
                                sID = sRaw >> 3
                                edgeCnt = sRaw & 0x03
                                print("sID {} | edgeCnt {}".format(sID, edgeCnt))
                                stopPos = copy.deepcopy(cnt_)

                        #print("other stuff {}".format(stopPos))

                        if stopPos != -1:
                            #print(int(rawOut[stopPos:55],10))
                            #print(rawOut)
                            print(stopPos)
                            print(rawOut[stopPos])

                        
                        lastTime = int(rawOut[27],10) << 16
                        lastTime = lastTime + ( int(rawOut[28],10) << 8 )
                        lastTime = lastTime + int(rawOut[29],10)
                        print("timestamp of last Event {}".format(lastTime))

                        lastTime = int(rawOut[58],10) << 16
                        lastTime = lastTime + ( int(rawOut[57],10) << 8 ) 
                        lastTime = lastTime + int(rawOut[56],10)
                        print("timestamp of last Event {}".format(lastTime))
                        print("\n")

                        

                else:
                    #frame02 = [[]]
                    if np.size(frame02) <= 5:
                        frame02 = [rawOut[1:]]
                    else:
                        frame02 = np.append(frame02,[rawOut[1:]], axis=0)

            except:
                print("error: ", sys.exc_info()[0])   
    print("alle the VIVE_REPORT_RF_WATCHMANx2 events")
    print(frame01)
    print(np.size(frame01))
   # print("print flags {}".format())

    print("other events like IMU")
    print(frame02)
    print(np.size(frame02))


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
    for cnt in range(30):
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
frame01 = [[]]


#print(len(frame01))
print("len frame01 {}".format(np.size(frame01)))

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

#time.sleep(10)
print("done")
time.sleep(1)


usb.util.release_interface(device, interfaceSelect)
device.attach_kernel_driver(interfaceSelect)


