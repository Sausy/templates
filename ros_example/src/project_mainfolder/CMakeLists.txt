cmake_minimum_required(VERSION 2.8.3)
project(ros_example)

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")

SET(CMAKE_BUILD_TYPE Debug)

#==============================================================================
# Dependencies
#==============================================================================
find_package(catkin REQUIRED COMPONENTS
        roscpp
        std_msgs
        message_generation
        )

catkin_package(CATKIN_DEPENDS
        message_runtime
        )

include_directories(
        include/
        ${catkin_INCLUDE_DIRS}
)
#==============================================================================
# Application
#==============================================================================
FILE(GLOB SRC_FILES src/*.cpp)
FILE(GLOB INCLUDE_FILES include/*.hpp)

add_executable( executable_name
        ${SRC_FILES}
        ${INCLUDE_FILES}
	       main.cpp
        )
#//add_dependencies(executable_name roboy_middleware_msgs_gencpp executable_name_msgs_gencpp)
target_link_libraries( executable_name -lpthread -lrt ${catkin_LIBRARIES})
