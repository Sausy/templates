cmake_minimum_required(VERSION 3.5)
project(talk)


if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()
if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()


#find_package(catkin REQUIRED COMPONENTS roscpp std_msgs)
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

#catkin_package()
#include_directories(${catkin_INCLUDE_DIRS})

#==============================================================================
# Dependencies
#==============================================================================
include_directories(
        lib/
        include/
				#${catkin_INCLUDE_DIRS}
				${Boost_INCLUDE_DIRS}
      )

#==============================================================================
# Application
#==============================================================================

FILE(GLOB SRC_FILES src/*.cpp)
FILE(GLOB INCLUDE_FILES lib/*.hpp)

add_executable( ${PROJECT_NAME}
        ${SRC_FILES}
        ${INCLUDE_FILES}
        main.cpp
        #${PROTO_SRCS}
				#${PROTO_HDRS}
				#LUT/lut.h
        )
ament_target_dependencies( ${PROJECT_NAME}
  			rclcpp
  			std_msgs
				)

install(TARGETS ${PROJECT_NAME}
  DESTINATION lib/${PROJECT_NAME})
install(DIRECTORY include/
  DESTINATION include)

ament_export_include_directories(include)
ament_export_dependencies(std_msgs)
ament_package()
