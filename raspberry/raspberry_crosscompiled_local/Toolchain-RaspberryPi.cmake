# this one is important
SET(CMAKE_SYSTEM_NAME Linux)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)

SET(UNKNOWN_LINUX_NAME arm-unknown-linux-gnueabi)

# specify the cross compiler
SET(CMAKE_C_COMPILER
$ENV{HOME}/.local/x-tools/${UNKNOWN_LINUX_NAME}/bin/${UNKNOWN_LINUX_NAME}-gcc)

SET(CMAKE_CXX_COMPILER
$ENV{HOME}/.local/x-tools/${UNKNOWN_LINUX_NAME}/bin/${UNKNOWN_LINUX_NAME}-g++)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH
$ENV{HOME}/.local/x-tools/${UNKNOWN_LINUX_NAME})

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#set(CMAKE_LIBRARY_ARCHITECTURE arm-linux-gnueabihf)
#set(CMAKE_EXE_LINKER_FLAGS “-rpath-link,${SYSROOT_PATH}/lib/${CMAKE_LIBRARY_ARCHITECTURE}:${SYSROOT_PATH}/usr/lib/${CMAKE_LIBRARY_ARCHITECTURE}” )

#set(CMAKE_MODULE_LINKER_FLAGS “-rpath-link,${SYSROOT_PATH}/lib/${CMAKE_LIBRARY_ARCHITECTURE}:${SYSROOT_PATH}/usr/lib/${CMAKE_LIBRARY_ARCHITECTURE}” )
