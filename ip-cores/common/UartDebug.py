#!/usr/bin/env python3

import serial
import math
import time


if __name__ == "__main__":
    import sys
    import struct

    BAUD_RATE = 115200;
    UART_FRAME_SIZE = 8;
    FRAME_SIZE = 16;
    FRAME_AMOUNT = 4;
    READ_SIZE = int((FRAME_SIZE * FRAME_AMOUNT) / UART_FRAME_SIZE);

    #print("BAUD: {}".format(sys.argv[2]))

    if len(sys.argv) < 2:
        print("Usage: {} </dev/tty...> [BAUD]".format(sys.argv[0]))
        exit(1)
    elif len(sys.argv) > 3:
        BAUD_RATE = sys.argv[2];

    print("BAUDRATE: {} | INTERFACE: {} | READ_SIZE {}".format(BAUD_RATE,sys.argv[1], READ_SIZE))

    if sys.argv[1].startswith("/dev/"):
        src = serial.Serial(sys.argv[1], BAUD_RATE)
        src.flush()
    else:
        print("Usage: {} </dev/tty...>".format(sys.argv[0]))
        exit(1);


    print("Waiting for device ...")
    sync = [b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff']
    syncBuffer = [b'\x00'] * len(sync)


    testCnt = 0;
    #src.write(b'\x41')
    while testCnt < 10000:
        b = src.read(1)
        if len(b) < 1:
            sys.exit(1)

        #print("{}".format(b))
        #src.write(b'\x41')
        #src.flush()
        #src.flush()
        if (testCnt == 0):
            src.write(b'\x41')
            #print("{}".format(b))
            if (b == b'H'):
                testCnt = 1
                print("H")
                #src.flush()
        elif (testCnt == 1):
            if (b == b'e'):
                testCnt = 2
                print("e")
                #src.flush()
        elif (testCnt == 2):
            #print("{}".format(b))
            if (b == b'l'):
                testCnt = 3
                print("l")
        elif (testCnt == 3):
            if (b == b'o'):
                testCnt = 4
                print("o")
        elif (testCnt == 4):
            if (b == b'\xff'):
                print("End")
                break;

        #src.flush()
        #time.sleep(0.1)

    print("Found ... ")

    customCMD_LUT = ["CFG_REPLY", "delta time", "DATA"]


    reading = src.read(READ_SIZE)
    while(len(reading) == READ_SIZE):
        frame = []
        frm_cnt = 0
        frm_cnt_shiftet = 0
        data = 0;
        CMD = 0;

        while(frm_cnt < READ_SIZE):
            #print("Data = {} {}".format(reading[READ_SIZE-1:READ_SIZE],reading[1:2]))
            #print("Data = {} ".format(reading))
            frame.append(struct.unpack("<B", reading[frm_cnt:frm_cnt+1])[0])
            if(frm_cnt == READ_SIZE-1):
                if (frame[frm_cnt] != 0xff):
                    print("out off Sync {}".format(READ_SIZE))
                    print("TodoWriteSyncCode")
                    print("frame[{}] = {:02x}".format(frm_cnt-2,frame[frm_cnt-2]))
                    print("frame[{}] = {:02x}".format(frm_cnt-1,frame[frm_cnt-1]))
                    print("frame[{}] = {:x}".format(frm_cnt,frame[frm_cnt]))
                    #frm_cnt = -1
                    #time.sleep(5.5)

            frm_cnt = frm_cnt + 1

        #customCMD = frame[0]
        ##CMD = frame[1]
        #data1 = frame[2]<<8 | frame[3]
        #data2 = frame[4]<<8 | frame[5]
        #sync =  frame[6]<<8 | frame[7]
        #print("customCMD {:2x} | CMD = {:2x} | data1: {:4x} | data2 {:4x} | sync: {:4x}\t".format(customCMD, CMD, data1, data2, sync),end='')
        #==============================
        #       CUSTOM COMMAND
        #==============================

        Sensor = frame[1] >> 1
        nPoly =  frame[0] >> 1
        nPolyValid = frame[0] & 0x01
        BeamWord =  ((frame[1]&0x01)<<16) | (frame[2]<<8) | frame[3]
        E_Width = frame[4]<<8 | frame[5]
        DBG_FLAGS = frame[6]
        sync = frame[7]

        if(nPolyValid) :
            print("Sensor[{}] Rdy | nPoly = {} | BeamWord: {:05x} | E_Width {} | FLAGS {:04b} | sync {:02x}\t".format(Sensor, nPoly, BeamWord, E_Width, DBG_FLAGS, sync),end='')
        else :
            print("Sensor[{}] --- | nPoly = -- | BeamWord: {:5x} | E_Width {} | FLAGS {:04b} | sync {:02x}\t".format(Sensor, BeamWord, E_Width,DBG_FLAGS, sync),end='')


        #print("customCMD {:x} | CMD = {:4x} | data1: {:8x} \t".format(customCMD, CMD, data1),end='')

        print()

        reading = src.read(READ_SIZE)
