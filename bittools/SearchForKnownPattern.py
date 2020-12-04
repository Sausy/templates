#!/usr/bin/env python3

import numpy as np

class parsDump(object):
    """docstring for ."""

    def __init__(self, path, endian):
        f = open(path,'r')
        self.bitDump = []
        bitDump = []

        for row in f:
            #temp_row = row.replace('\n','')
            #temp_row = temp_row.replace('\t', '')
            #x = int(data[0].replace('ID:',''),base=10)
            temp_row = row.split(" ")

            for i in range(0,len(temp_row)):
                try:
                    intBuffer = int(temp_row[i].replace('\n',''),base=16)
                    bitDump.append(intBuffer)
                except:
                    pass


        #print(bitDump)

        if endian == 1:
            print("Invert Stream")
            for i in range(0, len(bitDump)):
                self.bitDump.append(bitDump[len(bitDump) - i - 1])
        else:
            self.bitDump = bitDump


        print(self.bitDump)

        #self.bitDump = bitDump

class bitsearch(object):
    """docstring for ."""

    def __init__(self, searchValue, bitDump):
        self.searchValue = 0
        self.sizeOfSearchFrame = 0
        self.bitDump = bitDump

        self.normSearchValue(searchValue)
        self.getSearchLength()


    def normSearchValue(self,searchValue):
        if searchValue.find("x") == 1:
            print("input was hex")
            self.searchValue = int(searchValue,base=16)
        elif searchValue.find("b") == 1:
            print("input was binary")
            self.searchValue = int(searchValue,base=2)
        else:
            print("input was dezimal")
            self.searchValue = int(searchValue,base=10)

        print("Search Value 0b{0:b}".format(self.searchValue))


    def getSearchLength(self):
        MaxLength = 2**16-1
        for i in range(0,MaxLength):
            foundOne = (self.searchValue >> (MaxLength-i)) & 0x1
            if foundOne == 1:
                self.sizeOfSearchFrame = MaxLength - i + 1 # +1 to take start as 0 into account
                print("foundOne after {}|{}|{}".format(i,MaxLength, self.sizeOfSearchFrame))
                print("Value is 0b{0:b}".format(self.searchValue))
                break

    def search(self):
        #self.searchValue
        #self.sizeOfSearchFrame
        #self.bitDump

        frameValue = 0
        for i in range(0,self.sizeOfSearchFrame):
            frameValue = (frameValue << 1) | 0x1

        #print("frameValue: {0:b}".format(frameValue))

        Num = int(round(self.sizeOfSearchFrame/8.0+0.5))
        print("num: {} | {}".format(Num, self.sizeOfSearchFrame))
        currentFrame = np.int64(0)

        maxShift = (Num + 1)*8


        for dumpCnt in range(0,len(self.bitDump)-1):
            #get amount of 8bit
            #+0.5 to ensure it always has the next higher value
            currentFrame = currentFrame & frameValue
            for offset in range(0,Num):
                if len(self.bitDump) == dumpCnt+offset:
                    currentFrame = 0
                    break

                currentFrame = currentFrame << 8
                currentFrame = currentFrame | self.bitDump[dumpCnt+offset]
                #print("dump: {0:b} ".format(self.bitDump[dumpCnt+offset]))
                #print("dump: {} {} {}".format(len(self.bitDump),dumpCnt,offset))


                #print("{}".format(type(currentFrame)))


            print("currentFrame: {0:b}".format(currentFrame))

            #print("maxShift: {}".format(maxShift))



            for shift in range(0,maxShift+1):
                #print("ref {0:b}".format((currentFrame >> (maxShift-shift))))
                refFrame = (currentFrame >> (maxShift-shift)) & frameValue
                #print("ref {0:b}".format(refFrame))
                if refFrame == self.searchValue:
                    print("found shift:{} ".format(shift),end='')
                    print("| searchValue: {0:b}".format(self.searchValue))
                    for printCnt in range(dumpCnt,dumpCnt+8):
                        try:
                            if printCnt == dumpCnt+4:
                                print("\033[91m" + " {0:x}".format(self.bitDump[printCnt-4]) + "\033[0m",end='')
                            else:
                                print(" {0:x}".format(self.bitDump[printCnt-4]),end='')
                        except:
                            print("..")
                            raise

                    print("\n ",end='')
                    #print("{0:b}".format(currentFrame))
                    #print the coresponding bits in color
                    for printCnt in range(0,shift+8):
                        try:
                            bitBuffer = (currentFrame >> (maxShift-printCnt)) & 0x1 #(self.bitDump[dumpCnt] >> (8*(Num+1)-printCnt)) & 0x1
                            if (printCnt-self.sizeOfSearchFrame-4)%8 == 0:
                                print(' ',end='')

                            if (printCnt <= shift) and (printCnt > (shift - self.sizeOfSearchFrame)):
                                print("\033[91m" + "{}".format(bitBuffer) + "\033[0m",end='')
                            else:
                                print("{}".format(bitBuffer),end='')
                        except:
                            pass

                        #print("{0:x}".format(bitBuffer),end='')


                    print("\n")

            #the following is required otherwise we would find the same spote twice
            currentFrame = currentFrame & (frameValue >> 1)
                    #print("value: {0:x}".format(self.bitDump[dumpCnt]))



            #middelData = self.bitDump[dumpCnt+1]
            #lowerData = self.bitDump[dumpCnt+2]


            #currentFrame = ((upperData << uShift) | (middelData << mShift) | (lowerData << lShift)) & frameValue

if __name__ == "__main__":
    import sys

    if len(sys.argv) < 3:
        print("Usage: {} <enter value to search> <bitdump.txt> [optional: 0/1 big/littel Endian]\n\n=============\nthe search value can ether be (with examples)".format(sys.argv[0]))
        print("DEC: 420\nHEX: 0x41\nBIN: 0b1010101 \n !To ensure matching don't forget the identifyer 0x|0b")
        exit(1)

    endian = 0
    if len(sys.argv) == 4:
        endian = int(sys.argv[3], base=10)

    pD = parsDump(sys.argv[2], endian)
    bs = bitsearch(sys.argv[1],pD.bitDump)

    bs.search()
