#!/usr/bin/env python3

import serial
import math


if __name__ == "__main__":
    import sys
    import struct

    BAUD_RATE = 9600;
    UART_FRAME_SIZE = 8;
    FRAME_SIZE = 16;
    FRAME_AMOUNT = 2;
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
    else:
        print("Usage: {} </dev/tty...>".format(sys.argv[0]))
        exit(1);


    print("Waiting for device ...")
    sync = [b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff', b'\xff']
    syncBuffer = [b'\x00'] * len(sync)
    while sync != syncBuffer:
        b = src.read(1)
        if len(b) < 1:
            sys.exit(1)
        syncBuffer.append(b)
        syncBuffer = syncBuffer[1:]
    print("DEVICE found ....!")

    customCMD_LUT = ["CFG_REPLY", "delta time", "DATA"]


    reading = src.read(READ_SIZE)
    while(len(reading) == READ_SIZE):
        frame = []
        frm_cnt = 0
        frm_cnt_shiftet = 0
        data = 0;
        CMD = 0;

        while(frm_cnt <= FRAME_AMOUNT+1):
            frame.append(struct.unpack("<B", reading[frm_cnt:frm_cnt+1])[0])
            #print("frame {} = {:02x} | {:032b} ".format(frm_cnt,frame[frm_cnt],frame[frm_cnt]))
            frm_cnt = frm_cnt + 1

        #==============================
        #       CUSTOM COMMAND
        #==============================
        customCMD = frame[0] & 0x0f
        flags = frame[0]>>4 & 0xf
        CMD = frame[1] & 0xff
        data = frame[2]<<8 | frame[3]

        if customCMD <= len(customCMD_LUT) :
            print("CUSTOM_CMD[{}] | DATA = {:04x} | CMD: {:02x} | FLAGS {:04b}\t".format(customCMD_LUT[customCMD], data, CMD, flags),
                end='')
        else :
            print("CUSTOM_CMD[{}] | DATA = {:04x} | CMD: {:02x} | FLAGS {:04b}\t".format(customCMD_LUT[0], data, CMD, flags),
                end='')

        print()

        reading = src.read(READ_SIZE)
