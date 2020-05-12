cmake_minimum_required(VERSION 2.8.3)
project(rpi_ros)

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")

SET(CMAKE_BUILD_TYPE Debug)

#==============================================================================
# Dependencies
#==============================================================================
find_package(catkin REQUIRED COMPONENTS
            roscpp
            nodelet
            std_msgs
        )
#find_package(Curses REQUIRED)

catkin_package(CATKIN_DEPENDS
        message_runtime
        )

include_directories(
        lib/
        include/
        ${catkin_INCLUDE_DIRS}
        #${CURSES_INCLUDE_DIR}
      )
#==============================================================================
# Application
#==============================================================================

FILE(GLOB SRC_FILES src/*.cpp)
FILE(GLOB INCLUDE_FILES lib/*.hpp)

add_executable( rpi_ros
        ${SRC_FILES}
        ${INCLUDE_FILES}
        )

#add_dependencies(rpi_ros triangulation_msg_gencpp)
target_link_libraries( rpi_ros -lwiringPi -lpthread -lrt -lm ${catkin_LIBRARIES})
