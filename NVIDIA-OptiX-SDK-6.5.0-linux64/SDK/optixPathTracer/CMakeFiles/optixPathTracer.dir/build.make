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
include optixPathTracer/CMakeFiles/optixPathTracer.dir/depend.make

# Include the progress variables for this target.
include optixPathTracer/CMakeFiles/optixPathTracer.dir/progress.make

# Include the compile flags for this target's objects.
include optixPathTracer/CMakeFiles/optixPathTracer.dir/flags.make

optixPathTracer/CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.o: optixPathTracer/CMakeFiles/optixPathTracer.dir/flags.make
optixPathTracer/CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.o: optixPathTracer/optixPathTracer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object optixPathTracer/CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.o"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.o -c /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer/optixPathTracer.cpp

optixPathTracer/CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.i"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer/optixPathTracer.cpp > CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.i

optixPathTracer/CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.s"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer/optixPathTracer.cpp -o CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.s

# Object files for target optixPathTracer
optixPathTracer_OBJECTS = \
"CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.o"

# External object files for target optixPathTracer
optixPathTracer_EXTERNAL_OBJECTS =

bin/optixPathTracer: optixPathTracer/CMakeFiles/optixPathTracer.dir/optixPathTracer.cpp.o
bin/optixPathTracer: optixPathTracer/CMakeFiles/optixPathTracer.dir/build.make
bin/optixPathTracer: lib/libsutil_sdk.so
bin/optixPathTracer: /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/lib64/liboptix.so
bin/optixPathTracer: /usr/lib/x86_64-linux-gnu/libglut.so
bin/optixPathTracer: /usr/lib/x86_64-linux-gnu/libOpenGL.so
bin/optixPathTracer: /usr/lib/x86_64-linux-gnu/libGLX.so
bin/optixPathTracer: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/optixPathTracer: /usr/lib/x86_64-linux-gnu/libnvrtc.so
bin/optixPathTracer: optixPathTracer/CMakeFiles/optixPathTracer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/optixPathTracer"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optixPathTracer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
optixPathTracer/CMakeFiles/optixPathTracer.dir/build: bin/optixPathTracer

.PHONY : optixPathTracer/CMakeFiles/optixPathTracer.dir/build

optixPathTracer/CMakeFiles/optixPathTracer.dir/clean:
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer && $(CMAKE_COMMAND) -P CMakeFiles/optixPathTracer.dir/cmake_clean.cmake
.PHONY : optixPathTracer/CMakeFiles/optixPathTracer.dir/clean

optixPathTracer/CMakeFiles/optixPathTracer.dir/depend:
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer/CMakeFiles/optixPathTracer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : optixPathTracer/CMakeFiles/optixPathTracer.dir/depend

