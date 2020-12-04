#get to know your device 
befor plugging it in use
```
udevadm monitor
```
example output
```
monitor will print the received events for:
UDEV - the event which udev sends out after rule processing
KERNEL - the kernel uevent

KERNEL[99120.712832] add      /devices/pci0000:00/0000:00:14.0/usb1/1-1 (usb)
KERNEL[99120.714576] add      /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0 (usb)
KERNEL[99120.716906] add      /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:28DE:2101.0118 (hid)
KERNEL[99120.717097] add      /class/usbmisc (class)
KERNEL[99120.717132] add      /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/usbmisc/hiddev0 (usbmisc)
KERNEL[99120.717266] add      /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:28DE:2101.0118/hidraw/hidraw1 (hidraw)
KERNEL[99120.717287] bind     /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:28DE:2101.0118 (hid)
KERNEL[99120.717307] bind     /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0 (usb)
KERNEL[99120.717325] bind     /devices/pci0000:00/0000:00:14.0/usb1/1-1 (usb)
UDEV  [99120.717941] add      /class/usbmisc (class)
UDEV  [99120.720221] add      /devices/pci0000:00/0000:00:14.0/usb1/1-1 (usb)
UDEV  [99120.721515] add      /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0 (usb)
UDEV  [99120.722516] add      /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:28DE:2101.0118 (hid)
UDEV  [99120.722692] add      /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/usbmisc/hiddev0 (usbmisc)
UDEV  [99120.723807] add      /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:28DE:2101.0118/hidraw/hidraw1 (hidraw)
UDEV  [99120.724499] bind     /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:28DE:2101.0118 (hid)
UDEV  [99120.725379] bind     /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0 (usb)
UDEV  [99120.726667] bind     /devices/pci0000:00/0000:00:14.0/usb1/1-1 (usb)
```

this one seems to be hiddev0

so the path should be 
/dev/usb/hiddev0

beziehungsweise if we use linux raw usb lib

/dev/hidraw1 

!!! watch out /dev/hidraw0 was my mousepad for example

to show what driver the device is using 

```
lsusb -t
```
```
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
    |__ Port 1: Dev 78, If 0, Class=Human Interface Device, Driver=usbhid, 12M
```
the usbhid


attached is the example programm of linux .. which should output some nice data without messing up the Driver
