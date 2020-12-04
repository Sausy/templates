cmake_minimum_required(VERSION 3.15)
project(normal_programm)

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
#SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -std=gnu99 -rdynamic -Werror=incompatible-pointer-types -Wall -Wno-unused-variable -Wno-switch -Wno-parentheses -Wno-missing-braces -Werror=implicit-function-declaration -Wpedantic -Werror=return-type -fvisibility=hidden -Werror=vla")

SET(CMAKE_BUILD_TYPE Debug)

FILE(GLOB SRC_FILES src/*.c)
FILE(GLOB INCLUDE_FILES lib/*.h)



include_directories(
        include/inc
)

#add_subdirectory(./include)

add_executable( default_programm
        ${SRC_FILES}
        ${INCLUDE_FILES}
        )



target_link_libraries( default_programm -lpthread -lusb-1.0)
