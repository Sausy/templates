project(normal_programm)

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")

SET(CMAKE_BUILD_TYPE Debug)

FILE(GLOB SRC_FILES src/*.cpp)
FILE(GLOB INCLUDE_FILES lib/*.hpp)

add_executable( default_programm
        ${SRC_FILES}
        ${INCLUDE_FILES}
        )

target_link_libraries( default_programm)
