cmake_minimum_required(VERSION 2.8.3)
project( socket )

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")

#SET(CMAKE_BUILD_TYPE Debug)


#find_package(catkin REQUIRED COMPONENTS
#  roscpp
#  visualization_msgs
#)

#catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES using_markers
#  CATKIN_DEPENDS roscpp visualization_msgs
#  DEPENDS system_lib
#)



#==============================================================================
# Dependencies
#==============================================================================
include_directories(
        lib/
        include/
      )
#==============================================================================
# Application
#==============================================================================

FILE(GLOB SRC_FILES src/*.cpp)
FILE(GLOB INCLUDE_FILES lib/*.hpp)

add_executable( socket
        ${SRC_FILES}
        ${INCLUDE_FILES}
        )

target_link_libraries( socket -lpthread -lrt -lncurses )
