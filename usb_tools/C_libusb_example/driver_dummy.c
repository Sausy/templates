// All MIT/x11 Licensed Code in this file may be relicensed freely under the GPL
// or LGPL licenses.

#include "os_generic.h"
#include "survive_config.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <survive.h>

//include
#include "driver_dummy.h"
//include inital config functions for the dummy
#include "driver_dummy.config.h"

static bool FLAG_InitDone = false;
//static libusb_device_handle *dev_handle_;

STATIC_CONFIG_ITEM(DUMMY_DRIVER_ENABLE, "dummy-driver-enable", 'i', "Load a dummy driver for testing.", 0)

struct SurviveDriverDummy {
	SurviveContext *ctx;
	SurviveObject *so;
};
typedef struct SurviveDriverDummy SurviveDriverDummy;

static int dummy_poll(struct SurviveContext *ctx, void *_driver) {
	SurviveDriverDummy *driver = _driver;

	libusb_device **devs;
	//libusb_device_handle *dev_handle_;
	//libusb_context *ctx_ = NULL; //libusb session

	int ret = 0;

	//initialize the device
	if(!FLAG_InitDone){
		ret = startUp(USB_VENDOR_ID, USB_PRODUCT_ID);
		if(ret < 0)//if usb wasn't able to init...Abort
			return 0;


		getDescriptor(&buffer[0]);

		initConversationUsb(&buffer[0]);

		FLAG_InitDone = true;
	}



	//int ret = survive_get_ids(d, &idVendor, &idProduct);
	//device = usb.core.find(idVendor=VENDOR_ID, idProduct=PRODUCT_ID)

	/*
		To emit an IMU event, send this:
			driver->ctx->imuproc(so, mask, accelgyro, timecode, id);

		To emit light data, send this:
			LightcapElement le;
			le.sensor_id = X		//8 bits
			le.length = Z			//16 bits
			le.timestamp = Y		//32 bits
			handle_lightcap(so, &le);
	*/

	printf("[Info] End Poll\n");

	return 0;
}

static int dummy_close(struct SurviveContext *ctx, void *_driver) {
	SurviveDriverDummy *driver = _driver;

	//TODO: proberly shutdown interface;
	//libusb_close();
	/*
		If you need to handle any cleanup here, like closing handles, etc.
		you can perform it here.
	*/

	return 0;
}

int DriverRegDummy(SurviveContext *ctx) {
	SurviveDriverDummy *sp = SV_CALLOC(1, sizeof(SurviveDriverDummy));
	sp->ctx = ctx;

	SV_INFO("Setting up dummy driver.");

	// Create a new SurviveObject...
	SurviveObject *device = SV_CALLOC(1, sizeof(SurviveObject));
	device->ctx = ctx;
	device->driver = sp;
	memcpy(device->codename, "DM0", 4);
	memcpy(device->drivername, "DUM", 4);
	device->sensor_ct = 1;
	device->sensor_locations = SV_MALLOC(sizeof(FLT) * 3);
	device->sensor_normals = SV_MALLOC(sizeof(FLT) * 3);
	device->sensor_locations[0] = 0;
	device->sensor_locations[1] = 0;
	device->sensor_locations[2] = 0;
	device->sensor_normals[0] = 0;
	device->sensor_normals[1] = 0;
	device->sensor_normals[2] = 1;

	device->timebase_hz = 48000000;
	device->imu_freq = 1000.0f;

	sp->so = device;
	survive_add_object(ctx, device);

	//Register the handels for the the
	//Data pull from the USB-Device: dummy_poll
	//Close it clean: dummy_close
	survive_add_driver(ctx, sp, dummy_poll, dummy_close);
	return 0;
}

REGISTER_LINKTIME(DriverRegDummy)
