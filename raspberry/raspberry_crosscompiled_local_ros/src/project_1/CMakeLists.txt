cmake_minimum_required(VERSION 2.8)
project(HelloWorld)


# this one is important
SET(CMAKE_SYSTEM_NAME Linux)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
SET(CMAKE_C_COMPILER   /usr/bin/aarch64-linux-gnu-gcc)
SET(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH /usr/aarch64-linux-gnu)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
# end of the file

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

add_executable( HelloWorld
        ${SRC_FILES}
        ${INCLUDE_FILES}
        main.cpp
)


#add_executable(HelloWorld main.cpp )
target_link_libraries(HelloWorld -lpthread -lrt -lm ${catkin_LIBRARIES})
