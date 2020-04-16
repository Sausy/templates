## UDP Payload Data

The PayloadData gets encoded with a Protocol Buffer ... nanopb
https://github.com/nanopb/nanopb

!!!! There was a bug in the installation code 
change 
"#!/usr/bin/env python"
to 
"#!/usr/bin/env python3"

int the files ./nanopb/generator/protoc and nanopb_generator.py

required packages

```
sudo apt install python-protobuf
sudo apt install scons
pip install protobuf grpcio-tools

```

