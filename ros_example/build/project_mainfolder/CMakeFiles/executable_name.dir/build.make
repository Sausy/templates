# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sausy/Projects/templates/ros_example/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sausy/Projects/templates/ros_example/build

# Include any dependencies generated for this target.
include project_mainfolder/CMakeFiles/executable_name.dir/depend.make

# Include the progress variables for this target.
include project_mainfolder/CMakeFiles/executable_name.dir/progress.make

# Include the compile flags for this target's objects.
include project_mainfolder/CMakeFiles/executable_name.dir/flags.make

project_mainfolder/CMakeFiles/executable_name.dir/src/example_class.cpp.o: project_mainfolder/CMakeFiles/executable_name.dir/flags.make
project_mainfolder/CMakeFiles/executable_name.dir/src/example_class.cpp.o: /home/sausy/Projects/templates/ros_example/src/project_mainfolder/src/example_class.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/templates/ros_example/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object project_mainfolder/CMakeFiles/executable_name.dir/src/example_class.cpp.o"
	cd /home/sausy/Projects/templates/ros_example/build/project_mainfolder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/executable_name.dir/src/example_class.cpp.o -c /home/sausy/Projects/templates/ros_example/src/project_mainfolder/src/example_class.cpp

project_mainfolder/CMakeFiles/executable_name.dir/src/example_class.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/executable_name.dir/src/example_class.cpp.i"
	cd /home/sausy/Projects/templates/ros_example/build/project_mainfolder && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sausy/Projects/templates/ros_example/src/project_mainfolder/src/example_class.cpp > CMakeFiles/executable_name.dir/src/example_class.cpp.i

project_mainfolder/CMakeFiles/executable_name.dir/src/example_class.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/executable_name.dir/src/example_class.cpp.s"
	cd /home/sausy/Projects/templates/ros_example/build/project_mainfolder && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sausy/Projects/templates/ros_example/src/project_mainfolder/src/example_class.cpp -o CMakeFiles/executable_name.dir/src/example_class.cpp.s

project_mainfolder/CMakeFiles/executable_name.dir/main.cpp.o: project_mainfolder/CMakeFiles/executable_name.dir/flags.make
project_mainfolder/CMakeFiles/executable_name.dir/main.cpp.o: /home/sausy/Projects/templates/ros_example/src/project_mainfolder/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/templates/ros_example/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object project_mainfolder/CMakeFiles/executable_name.dir/main.cpp.o"
	cd /home/sausy/Projects/templates/ros_example/build/project_mainfolder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/executable_name.dir/main.cpp.o -c /home/sausy/Projects/templates/ros_example/src/project_mainfolder/main.cpp

project_mainfolder/CMakeFiles/executable_name.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/executable_name.dir/main.cpp.i"
	cd /home/sausy/Projects/templates/ros_example/build/project_mainfolder && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sausy/Projects/templates/ros_example/src/project_mainfolder/main.cpp > CMakeFiles/executable_name.dir/main.cpp.i

project_mainfolder/CMakeFiles/executable_name.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/executable_name.dir/main.cpp.s"
	cd /home/sausy/Projects/templates/ros_example/build/project_mainfolder && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sausy/Projects/templates/ros_example/src/project_mainfolder/main.cpp -o CMakeFiles/executable_name.dir/main.cpp.s

# Object files for target executable_name
executable_name_OBJECTS = \
"CMakeFiles/executable_name.dir/src/example_class.cpp.o" \
"CMakeFiles/executable_name.dir/main.cpp.o"

# External object files for target executable_name
executable_name_EXTERNAL_OBJECTS =

/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: project_mainfolder/CMakeFiles/executable_name.dir/src/example_class.cpp.o
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: project_mainfolder/CMakeFiles/executable_name.dir/main.cpp.o
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: project_mainfolder/CMakeFiles/executable_name.dir/build.make
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /opt/ros/melodic/lib/libroscpp.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /opt/ros/melodic/lib/librosconsole.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /opt/ros/melodic/lib/librostime.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /opt/ros/melodic/lib/libcpp_common.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name: project_mainfolder/CMakeFiles/executable_name.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sausy/Projects/templates/ros_example/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable /home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name"
	cd /home/sausy/Projects/templates/ros_example/build/project_mainfolder && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/executable_name.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
project_mainfolder/CMakeFiles/executable_name.dir/build: /home/sausy/Projects/templates/ros_example/devel/lib/ros_example/executable_name

.PHONY : project_mainfolder/CMakeFiles/executable_name.dir/build

project_mainfolder/CMakeFiles/executable_name.dir/clean:
	cd /home/sausy/Projects/templates/ros_example/build/project_mainfolder && $(CMAKE_COMMAND) -P CMakeFiles/executable_name.dir/cmake_clean.cmake
.PHONY : project_mainfolder/CMakeFiles/executable_name.dir/clean

project_mainfolder/CMakeFiles/executable_name.dir/depend:
	cd /home/sausy/Projects/templates/ros_example/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sausy/Projects/templates/ros_example/src /home/sausy/Projects/templates/ros_example/src/project_mainfolder /home/sausy/Projects/templates/ros_example/build /home/sausy/Projects/templates/ros_example/build/project_mainfolder /home/sausy/Projects/templates/ros_example/build/project_mainfolder/CMakeFiles/executable_name.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : project_mainfolder/CMakeFiles/executable_name.dir/depend

