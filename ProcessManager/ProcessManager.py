import numpy as np
import time
import systemd.daemon

class processManager:
    PathRosCore = '/home/ubuntu/docker/node-red/x64/docker-exchange/controll/roscore'
    PathRosInterface = ' /home/ubuntu/docker/node-red/x64/docker-exchange/controll/processing'
    PathRosTracker = '/home/ubuntu/docker/node-red/x64/docker-exchange/controll/tracker'


    def __init__(self):
        print("processManager ... done")

    def getTransferData(self):
        f = open(PathRosCore,"r")
        print("PathRosCore {}".format(f.read()))
        f = open(PathRosInterface,"r")
        print("PathRosInterface {}".format(f.read()))
        f = open(PathRosTracker,"r")
        print("PathRosTracker {}".format(f.read()))



def main():
    print('Starting up ...')
    print('Starting up ... [wait 10sec]')
    time.sleep(10)
    print('Starting up ... [processManager]')
    mng = processManager()
    systemd.daemon.notify('READY=1')

    while True:
        print('Hello from the Python Demo')
        mng.getTransferData()
        time.sleep(5)


if __name__ == "__main__":
    main()
