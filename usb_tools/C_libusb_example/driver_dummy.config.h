//*********************************************
//        *** STARTUP ****
//*********************************************
//Maintain this order due to static corelation
static libusb_context *ctx_ = NULL;
static libusb_device_handle *dev_handle_;

static int startUp(uint16_t idVendor, uint16_t idProduct);
static void getDescriptor(unsigned char * data);


static int startUp(uint16_t idVendor, uint16_t idProduct){
  int ret;

  //==================================
  //========INIT libusb======
  //==================================
  printf("\n[Info] INIT USB");
  ret = libusb_init(&ctx_);

  if(ret < 0){
    printf("[Info] libusb_init failed ... ABORT\n");
    fflush(stdout);
    return -1;
  }

  //set verbosity level to 3 as suggest in the documentation
  //libusb_set_debug(ctx_,4);

  //==================================
  //========geting device handle======
  //==================================
  printf("\n[Info] get the device from VENDOR_ID and PRODUCT_ID");
  dev_handle_ = libusb_open_device_with_vid_pid(ctx_, USB_VENDOR_ID, USB_PRODUCT_ID);


  if(dev_handle_ == NULL){
    printf("[Info] cannot open device\n");
    fflush(stdout);
    return -2;
  }

  //==================================
  //========kernel attachment=========
  //==================================
  int actual; //used to find out how many bytes were written
  //find out if kernel driver is attached
  if(libusb_kernel_driver_active(dev_handle_, INTERFACE_NO) == 1) {
      printf("\n[Info] Kernel Driver Active");
      if(libusb_detach_kernel_driver(dev_handle_, INTERFACE_NO) == 0) //detach it
          printf("\n[Info] Kernel Driver Detached!");
  }
  ret = libusb_claim_interface(dev_handle_, INTERFACE_NO); //claim interface 0 (the first) of device (mine had jsut 1)

  if(ret < 0){
    printf("[Info] cannot claim Interface... ABORT\n");
    fflush(stdout);
    return -3;
  }

  printf("\n[Info] No errors should all work");

  fflush(stdout);
  return 0;
}

//*********************************************
//*********************************************
static void getDescriptor(unsigned char * data){
  int ret;

  printf("\n[Info] request Device");
  //int ret_ = dev.ctrl_transfer(0x80, 0x06, 0x0100, 0, 0x28)
  //

  //unsigned char payload_or_inBytes[64];
  //payload_or_inBytes[0] = 0x28;

  uint8_t bmRequestType = 0x80;
  uint8_t bmRequest = 0x06;
  uint16_t wValue = 0x0100;
  uint16_t wIndex = 0;
  uint16_t wLength = 18;

  unsigned char * tempData = data;
  *tempData = 0x28;
  tempData++;
  //unsigned char payload_or_inBytes[64];
  //payload_or_inBytes[0] = 0x28;


  ret = libusb_control_transfer(dev_handle_, bmRequestType, bmRequest, wValue, wIndex, data, wLength, 1000);

  if(ret == 0) //we wrote the 4 bytes successfully
    printf("\n[Info] Writing Successful! getDescriptor");
  else
    printf("\n[Info] Write Error [getDescriptor]");
        //fprintf(stderr, "Error Writing: %s", libusb_strerror(static_cast<libusb_error>(r



  //ret = libusb_control_transfer(handle, bmRequestType, bmRequest, wValue, wIndex, payload_or_inBytes, wLength, 1000);

  printf("\n[Info] Ret %d", ret);


  printf("\n[Info] End descriptor");
  fflush(stdout);
}

static void callBack_interrupt(struct libusb_transfer *transfer){
  ;
}
static void initConversationUsb(unsigned char * data){
  int ret;
  unsigned char * tempData = data;
  //**** Starting with an Interrupt in **//

  //struct libusb_transfer trans;
  struct libusb_transfer *tx = libusb_alloc_transfer(0);
  void *foo; //TODO: do something prober;
  libusb_fill_interrupt_transfer(tx, dev_handle_, 0x81, data, 59, callBack_interrupt, foo,0);
  ret = libusb_submit_transfer(tx);
  /*

  int aL;
  trans.dev_handle =  dev_handle_;
  trans.flags = 6; //captured from wire shark//0000   04 02 00 00
  trans.endpoint = 0x81;
  trans.type = LIBUSB_TRANSFER_TYPE_INTERRUPT;
  trans.timeout = 0;
  //trans.status = LIBUSB_TRANSFER_COMPLETED;
  trans.length = 59;
  //trans.type = &aL;
  //trans.callback = ;
  //trans.user_data = ;
  trans.buffer = data;
  trans.num_iso_packets = 1;


  //ret = libusb_submit_transfer(&trans);
  printf("\n[Info] dbg");
  fflush(stdout);
  //ret = libusb_interrupt_transfer(dev_handle_, 0x81, data, 64, &transferred[0], 1000);
  */


  //printf("\n[Info] ret %d | %d | %d", ret, transferred[0], transferred[1]);

  unsigned char txData[] = {\
    0xff,0x96,0x10,0xbe,0x5b,0x32,0x54,0x11,0xcf,0x83,0x75,0x53,0x8a,0x08,0x6a,0x53,\
    0x58,0xd0,0xb1,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,\
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,\
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 \
    };
  uint8_t bmRequestType = 0x21;
  uint8_t bmRequest = 0x09;
  uint16_t wValue = 0x03ff;
  uint16_t wIndex = 0;
  uint16_t wLength = sizeof(txData);

  for (size_t i = 0; i < sizeof(txData); i++) {
      *tempData = txData[i];
      tempData++;
  }

  ret = libusb_control_transfer(dev_handle_, bmRequestType, bmRequest, wValue, wIndex, data, wLength, 1000);

  if(ret == 0) //we wrote the 4 bytes successfully
      printf("[Info] Writing Successful!");
  else
      printf("[Info] Write Error");

  /*
  0000   c0 73 59 39 45 99 ff ff 53 02 80 32 01 00 00 3c
  0010   14 ed 86 5f 00 00 00 00 35 48 0e 00 8d ff ff ff
  0020   41 00 00 00 00 00 00 00 a1 01 05 03 00 00 41 00
  0030   00 00 00 00 00 00 00 00 00 02 00 00 00 00 00 00
  */

  bmRequestType = 0xa1;
  bmRequest = 0x01;
  wValue = 0x0305;
  wIndex = 0;
  wLength = 0x41;

  ret = libusb_control_transfer(dev_handle_, bmRequestType, bmRequest, wValue, wIndex, data, wLength, 1000);

  if(ret == 0) //we wrote the 4 bytes successfully
      printf("[Info] Writing Successful!");
  else
      printf("[Info] Write Error");

}
