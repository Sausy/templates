cmake_minimum_required(VERSION 2.8.3)
project(socket)

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
# # SET(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/nanopb/extra)

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
        )

target_link_libraries( socket -lpthread -lrt -lncurses -pthread)
