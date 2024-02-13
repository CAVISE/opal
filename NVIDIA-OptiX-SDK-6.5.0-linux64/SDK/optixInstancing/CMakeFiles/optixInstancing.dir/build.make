# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK

# Include any dependencies generated for this target.
include optixInstancing/CMakeFiles/optixInstancing.dir/depend.make

# Include the progress variables for this target.
include optixInstancing/CMakeFiles/optixInstancing.dir/progress.make

# Include the compile flags for this target's objects.
include optixInstancing/CMakeFiles/optixInstancing.dir/flags.make

optixInstancing/CMakeFiles/optixInstancing.dir/optixInstancing.cpp.o: optixInstancing/CMakeFiles/optixInstancing.dir/flags.make
optixInstancing/CMakeFiles/optixInstancing.dir/optixInstancing.cpp.o: optixInstancing/optixInstancing.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object optixInstancing/CMakeFiles/optixInstancing.dir/optixInstancing.cpp.o"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optixInstancing.dir/optixInstancing.cpp.o -c /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing/optixInstancing.cpp

optixInstancing/CMakeFiles/optixInstancing.dir/optixInstancing.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optixInstancing.dir/optixInstancing.cpp.i"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing/optixInstancing.cpp > CMakeFiles/optixInstancing.dir/optixInstancing.cpp.i

optixInstancing/CMakeFiles/optixInstancing.dir/optixInstancing.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optixInstancing.dir/optixInstancing.cpp.s"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing/optixInstancing.cpp -o CMakeFiles/optixInstancing.dir/optixInstancing.cpp.s

# Object files for target optixInstancing
optixInstancing_OBJECTS = \
"CMakeFiles/optixInstancing.dir/optixInstancing.cpp.o"

# External object files for target optixInstancing
optixInstancing_EXTERNAL_OBJECTS =

bin/optixInstancing: optixInstancing/CMakeFiles/optixInstancing.dir/optixInstancing.cpp.o
bin/optixInstancing: optixInstancing/CMakeFiles/optixInstancing.dir/build.make
bin/optixInstancing: lib/libsutil_sdk.so
bin/optixInstancing: /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/lib64/liboptix.so
bin/optixInstancing: /usr/lib/x86_64-linux-gnu/libglut.so
bin/optixInstancing: /usr/lib/x86_64-linux-gnu/libOpenGL.so
bin/optixInstancing: /usr/lib/x86_64-linux-gnu/libGLX.so
bin/optixInstancing: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/optixInstancing: /usr/lib/x86_64-linux-gnu/libnvrtc.so
bin/optixInstancing: optixInstancing/CMakeFiles/optixInstancing.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/optixInstancing"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optixInstancing.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
optixInstancing/CMakeFiles/optixInstancing.dir/build: bin/optixInstancing

.PHONY : optixInstancing/CMakeFiles/optixInstancing.dir/build

optixInstancing/CMakeFiles/optixInstancing.dir/clean:
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing && $(CMAKE_COMMAND) -P CMakeFiles/optixInstancing.dir/cmake_clean.cmake
.PHONY : optixInstancing/CMakeFiles/optixInstancing.dir/clean

optixInstancing/CMakeFiles/optixInstancing.dir/depend:
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing/CMakeFiles/optixInstancing.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : optixInstancing/CMakeFiles/optixInstancing.dir/depend

