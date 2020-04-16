cmake_minimum_required(VERSION 2.8.3)
project(socket)

#SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
SET(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/nanopb/extra)
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Werror -g -O0")

#SET(CMAKE_BUILD_TYPE Debug)

find_package(Nanopb REQUIRED)
include_directories(${NANOPB_INCLUDE_DIRS})

#==============================================================================
# Generate Headers
#==============================================================================
nanopb_generate_cpp(PROTO_SRCS PROTO_HDRS RELPATH proto
	proto/lighthouse.proto)


include_directories(${CMAKE_CURRENT_BINARY_DIR})
#add_custom_target(generate_proto_sources DEPENDS ${PROTO_SRCS} ${PROTO_HDRS})
set_source_files_properties(${PROTO_SRCS} ${PROTO_HDRS}
    PROPERTIES GENERATED TRUE)


SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")
#==============================================================================
# Dependencies
#==============================================================================
include_directories(
        lib/
        #include/
      )
#==============================================================================
# Application
#==============================================================================

FILE(GLOB SRC_FILES src/*.cpp)
FILE(GLOB INCLUDE_FILES lib/*.hpp)

add_executable( socket
        ${SRC_FILES}
        ${INCLUDE_FILES}
        main.cpp
        ${PROTO_SRCS}
				${PROTO_HDRS}
        )

#target_link_libraries( socket -lpthread -lrt -lncurses )
