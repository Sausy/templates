#!/usr/bin/env python3

import numpy as np
#from pylab import imshow,subplot,show
import pylab

class parsDump(object):
    """docstring for ."""

    def __init__(self, path, endian, type):
        f = open(path,'r')

        if type == 0:
            self.bitDump = self.getDataAsOneSequence(f)
        elif type == 1:
            self.bitDump = self.getDataAsMatrix(f)
        else:
            self.bitDump = []
            print("select a proper type")


        #self.bitDump = bitDump
    def mxReshape(self,Matrix,m,n):
        return np.pad(Matrix,((0,m-len(Matrix)),(0,n - np.shape(Matrix)[1])), mode='constant', constant_values=0)


    def getDataAsMatrix(self,f):
        ret = [[]]
        #self.f

        buffCnt = 0
        [m,n] = [1,1]
        ret = self.mxReshape(ret,m,n)
        #print(ret)
        #print(np.size(ret))

        columCnt = 0
        rowCnt = 0
        for num, row in enumerate(f):
            #temp_row = row.replace('\n','')
            #temp_row = temp_row.replace('\t', '')
            #x = int(data[0].replace('ID:',''),base=10)
            #print("\nPrint current Row: ", m)
            #print(row)

            if row == "\n":
                #buffCnt = buffCnt + 1
                #print("==========")
                m = m + 1
                columCnt = 0
                ret = self.mxReshape(ret,m,n)
            else:
                #print(row)
                temp_row = row.replace('\n','')

                temp_array = temp_row.split(" ")

                #Check if Matrix needs an *n* extension
                #if len(temp_array)+columCnt > n:
                #    n = len(temp_row)
                #    ret = self.mxReshape(ret,m,n)

                #print("Print current ret: ", n)
                #transfer the str as hex to matrix
                for i,data_ in enumerate(temp_array):
                    try:
                        columCnt = columCnt + 1
                        if columCnt > n:
                            n = columCnt
                            ret = self.mxReshape(ret,m,n)

                        ret[m-1,columCnt-1] = int(data_,base=16)
                        #print("ret ", int(data_,base=16) )
                    except:
                        pass
                #temp_array = [int(i,base=16) for i in temp_array]
                #temp_array = int(temp_row.split(" "),base=16)

                #print("Print processed row: ", num)
                #print(ret)




        #print("\n[m,n] {},{}".format(m,n))
        print(ret)


        return ret

    def getDataAsOneSequence(self,f):
        bitDump = []

        ret = []

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
                ret.append(bitDump[len(bitDump) - i - 1])
        else:
            ret = bitDump

        print(ret)

        return ret



class printBits(object):
    def __init__(self,bitDump):
        self.d = self.convertToBitMatrix(bitDump)

        print(self.d.shape)
        deletColumns = [55,56,72,73,74,75,76,87,88,104,105,106,107,108,119,120,136,137,138,139,140,54,86,118]
        deletColumns = np.sort(deletColumns)
        for i in range(0,len(deletColumns)):
            self.d = np.delete(self.d,deletColumns[i]-i,1)

        #self.d = np.delete(self.d,45,0)
        print(self.d.shape)

        print("usage Note: a field in bitDump should be uint8 type")

    def exampleplot(self):
        M = np.random.choice([0,1], size=(10,2), p=[1./3, 2./3])
        print("M: {}".format(M))
        pylab.imshow(M,cmap="Greys")
        pylab.show()

    def mxReshape(self,Matrix,m,n):
        return np.pad(Matrix,((0,m-len(Matrix)),(0,n - np.shape(Matrix)[1])), mode='constant', constant_values=0)

    def convertToBitMatrix(self,bitDump):
        ret = [[]]
        [m,n] = np.shape(bitDump)
        n = n*8 #bitDump should consinst onl
        ret = self.mxReshape(bitDump,m,n)

        #for rowCnt,
        for rowCnt,data_ in enumerate(bitDump):
            for colCnt,singleValue in enumerate(data_):
                #print(data_)
                for i in range(0,8):
                    bitBuf = int(bitDump[rowCnt,colCnt])
                    ret[rowCnt,(colCnt*8)+i] = (bitBuf>> (7-i)) & 0x1
                    #print(i)

        meanVec = np.mean(ret, axis=0)
        print("==================")
        print("The *mean* bits are")
        print("len {}".format(len(meanVec)))
        print(meanVec)

        m = m + 2
        ret = self.mxReshape(ret,m,n)
        for i in range(0,n):
            ret[m-2, i] = meanVec[i]
            if meanVec[i] >= 0.6:
                meanVec[i] = 1
            elif meanVec[i] <= 0.4:
                meanVec[i] = 0
            else:
                pass
            ret[m-1, i] = meanVec[i]

        return ret

    def plot(self):
        print(self.d)

        #for i in range(0,self.d.shape[1]):
        #    menVec = np.mean(self.d, axis=0)


        pylab.imshow(self.d,cmap="Greys")
        #pylab.imshow(self.d)
        pylab.xticks(range(0,self.d.shape[1],5))
        pylab.show()




if __name__ == "__main__":
    import sys

    if len(sys.argv) < 1:
        print("Usage: {}  <bitdump.txt> [optional: 0/1 big/littel Endian]\n\n=============\nthe search value can ether be (with examples)".format(sys.argv[0]))
        exit(1)

    endian = 0
    if len(sys.argv) == 3:
        endian = int(sys.argv[3], base=10)

    pD = parsDump(sys.argv[1], endian, type=1)

    pB = printBits(pD.bitDump)
    pB.plot()
