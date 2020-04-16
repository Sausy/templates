#ifndef PROTOLIGHTHOUSE_H
#define PROTOLIGHTHOUSE_H

//#define System_IS_ESP
#ifdef System_IS_ESP
  #include "logging.h"
  #include "lighthouse.pb.h"
  #include "helper_3dmath.h"
  #include "pb.h"
  #include "pb_encode.h"
  #include "pb_decode.h"
#endif
#ifndef System_IS_ESP
  #include <cmath>
  #include <stdlib.h>
  #include <iostream>
  #include <lighthouse.pb.h>
  #include <pb_encode.h>
  #include <pb_decode.h>
#endif






typedef enum _ES{
    ES_WIFI_FAIL_INIT_NO_SHIELD = 1,
    ES_WIFI_FAIL_INIT_CANNOT_CONNECT,
    ES_WIFI_FAIL_UDP_SOCKET,
    ES_PROTO_FAIL_INIT,
    ES_PROTO_FAIL_ENCODE,
    ES_PROTO_FAIL_DECODE,
    ES_PROTO_ERROR,
    ES_PROTO_SUCCESS,
    ES_WIFI_SUCCESS,
    ES_WIFI_ERROR,
}ES_PROTO;

class PROTO_LOVE{
public:
    PROTO_LOVE();
    void clearProtos();
    bool decode_config_Proto(pb_byte_t * buffer, size_t rcvd_msg_len);
    bool decode_command_Proto(pb_byte_t * buffer, size_t rcvd_msg_len);
    bool ecode_config_Proto(uint32_t ip, int32_t logginPort_l,int32_t sensorPort_l,int32_t imuPort_l, pb_byte_t *buffer, size_t &msg_len );
    bool encode_trackedObjConfig(uint32_t ip, uint16_t cmndPort_l, pb_byte_t *buffer, size_t &msg_len );
    bool encode_loggingObject(const char *msg, pb_byte_t *buffer, size_t &msg_len);
#ifdef System_IS_ESP
    bool encode_imuObjConfig(Quaternion &q, VectorInt16 &acc, VectorFloat &gravity, pb_byte_t *buffer, size_t &msg_len );
#endif
    bool enable_logging = true;
	DarkRoomProtobuf_loggingObject            loggingObjMsg;
	DarkRoomProtobuf_commandObject            commandObjMsg;
	DarkRoomProtobuf_configObject             configObjMsg;
  DarkRoomProtobuf_imuObject                imuObjMsg;
};

#endif
