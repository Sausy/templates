#include <stdio.h>
#include <stdlib.h>
//#include <string.h>
//#include <iostream>

//#include <libusb.h>
#include <libusb-1.0/libusb.h>

//#include <hidapi.h>

#define USB_VENDOR_ID  0x28DE
#define USB_PRODUCT_ID  0x2101
#define USB_MANUFACTUR_NAME  "Valve Software"
#define INTERFACE_NO 0 //some devices have more than two interfaces

#define BUFFER_SIZE 64



static libusb_context *ctx = NULL;
static libusb_device_handle * dev_handle;

static int startUp(uint16_t idVendor, uint16_t idProduct){
  int ret;
  ret = libusb_init(&ctx);
  //static libusb_device_handle *dev_handle = dev_handle;
  //dev_handle = dev_handle;

  if(ret < 0)
    printf("[Error] libusb_init failed ... ABORT\n");

  libusb_set_debug(ctx,4);

  dev_handle = libusb_open_device_with_vid_pid(ctx, USB_VENDOR_ID, USB_PRODUCT_ID);
  if(dev_handle == NULL)
    printf("[Info] cannot open device\n");


  //find out if kernel driver is attached
  if(libusb_kernel_driver_active(dev_handle, INTERFACE_NO) == 1) {
      printf("\n[Info] Kernel Driver Active");
      if(libusb_detach_kernel_driver(dev_handle, INTERFACE_NO) == 0) //detach it
          printf("\n[Info] Kernel Driver Detached!");
  }
  ret = libusb_claim_interface(dev_handle, INTERFACE_NO); //claim interface 0 (the first) of device (mine had jsut 1)

  if(ret < 0)
      printf("[Info] cannot claim Interface... ABORT\n");


  return 0;



}

//static libusb_context *ctx = NULL;
//static libusb_device_handle *handle;


//static libusb_device_handle *handle_;

static unsigned char buffer[BUFFER_SIZE];



//static unsigned char buffer[BUFFER_SIZE];


int main(void){


  libusb_device **devs;
  //libusb_device_handle *dev_handle;
  //libusb_context *ctx = NULL; //libusb session
  int ret = 0;
  int actual; //used to find out how many bytes were written
  //libusb_device_handle *dev_handle;

  ret = startUp(USB_VENDOR_ID, USB_PRODUCT_ID);

  uint8_t bmRequestType = 0x80;
  uint8_t bmRequest = 0x06;
  uint16_t wValue = 0x0100;
  uint16_t wIndex = 0;
  uint16_t wLength = 18;
  unsigned char payload_or_inBytes[64];
  payload_or_inBytes[0] = 0x28;


  //ret = startUp(ctx_, dev_handle, USB_VENDOR_ID, USB_PRODUCT_ID);
  //if(ret < 0)//if usb wasn't able to init...Abort
  // printf("ERROR");



  ret = libusb_control_transfer(dev_handle, bmRequestType, bmRequest, wValue, wIndex, &payload_or_inBytes[0], wLength, 1000);



  //trans->dev_handle =  dev_handle;
  struct libusb_transfer trans;
  trans.endpoint = 0x81;

   //std::cout << "hello world";
   for (size_t i = 0; i < 2000; i++) {
      printf(".");
   }

  ret = libusb_release_interface(dev_handle, INTERFACE_NO);
  libusb_close(dev_handle);
  libusb_exit(ctx);
  return 0;
}
