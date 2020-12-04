#pragma once

#ifdef __FreeBSD__
#include <libusb.h>
#else
#include <libusb-1.0/libusb.h>
#endif

#include "os_generic.h"


#define USB_VENDOR_ID  0x28DE
#define USB_PRODUCT_ID  0x2101
#define USB_MANUFACTUR_NAME  "Valve Software"
#define INTERFACE_NO 0 //some devices have more than two interfaces

#define BUFFER_SIZE 64

static unsigned char buffer[BUFFER_SIZE];
