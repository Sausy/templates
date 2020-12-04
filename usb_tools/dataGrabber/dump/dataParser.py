import numpy as np 

def tool_rawToTuple(raw):
    data_out = tuple()
    print(raw)
    for i in raw:
        data_out = data_out + (int(i,16),)
    return data_out


f = open("capRawData_noLight01.txt", "r")

rawData = tuple()

for line in f:
    rawDump = line
    rawDump = rawDump.replace("array", "")
    rawDump = rawDump.replace("]","")
    rawDump = rawDump.replace("[","")
    rawDump = rawDump.replace("(","")
    rawDump = rawDump.replace(")","")
    rawDump = rawDump.replace("'","")
    rawDump = rawDump.replace(" ","")


    rawData = rawData + (rawDump.split(), )

#y = [[0],[0],[0]]
y =[[0,0,0]]
time =[[0,0,0]]
remains_y = [[0,0,0]]

for x in rawData:
    #print(x)
    raw = x[0]
    raw_num = raw.split(',')
    #print(raw_num)
    #print(raw_num[1])
    time = np.append(time,[[raw_num[2],raw_num[4],raw_num[7]]], axis=0)
    #y = np.append(y,[[raw_num[2],raw_num[4],raw_num[7]]], axis=0)
    remains_y = np.append(remains_y,[[raw_num[2],raw_num[4],raw_num[7]]], axis=0)
    print(y)
    break
    #y.append([x[2],0,0])
    #print(y)

##============
# assuming fixpoint representation of k=2 and
# non Vorkommerstellen n=0 
# this means +/- 0,00 
##============
extData00 = 0.0#6.884512 191552 	gyro +0.02 -0.00 -0.01 accel +0.90 -0.02 +9.94
extData01 = "23 4c 0f 4e 80 ac 76 01 f9 ff 38 10 16 00 fd ff".split()
extData01 = extData01 + "f7 ff 7e 7a b1 7d 00 00 00 00 00 00 00 00".split()

extData10 = 0.0#6.880528 000320 	gyro +0.02 -0.00 -0.01 accel +0.91 +0.05 +9.94
extData11 = "23 4c 0f 4b 80 c1 7a 01 13 00 37 10 15 00 fd ff".split()
extData11 = extData11 + "f7 ff 4b 69 0b 73 00 00 00 00 00 00 00 00".split()

extData20 = 0.0#8.932427 072384 	gyro -0.36 +0.13 -0.03 accel +4.98 -4.12 -6.86
extData21 = "23 96 0f 17 e8 3c 1f 08 49 f9 cd f4 af fe 76 00".split()
extData21 = extData21 + "e4 ff 03 d2 43 9b fe ff f6 ff 85 fc 95 4c".split()


data_out = tool_rawToTuple(extData1)


#print(type(rawData))
#print(rawData[:][1])
#x = list(rawData[:])
#print(x[0:2,2])

