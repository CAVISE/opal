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
include optixMeshViewer/CMakeFiles/optixMeshViewer.dir/depend.make

# Include the progress variables for this target.
include optixMeshViewer/CMakeFiles/optixMeshViewer.dir/progress.make

# Include the compile flags for this target's objects.
include optixMeshViewer/CMakeFiles/optixMeshViewer.dir/flags.make

optixMeshViewer/CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.o: optixMeshViewer/CMakeFiles/optixMeshViewer.dir/flags.make
optixMeshViewer/CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.o: optixMeshViewer/optixMeshViewer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object optixMeshViewer/CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.o"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.o -c /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer/optixMeshViewer.cpp

optixMeshViewer/CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.i"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer/optixMeshViewer.cpp > CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.i

optixMeshViewer/CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.s"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer/optixMeshViewer.cpp -o CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.s

# Object files for target optixMeshViewer
optixMeshViewer_OBJECTS = \
"CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.o"

# External object files for target optixMeshViewer
optixMeshViewer_EXTERNAL_OBJECTS =

bin/optixMeshViewer: optixMeshViewer/CMakeFiles/optixMeshViewer.dir/optixMeshViewer.cpp.o
bin/optixMeshViewer: optixMeshViewer/CMakeFiles/optixMeshViewer.dir/build.make
bin/optixMeshViewer: lib/libsutil_sdk.so
bin/optixMeshViewer: /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/lib64/liboptix.so
bin/optixMeshViewer: /usr/lib/x86_64-linux-gnu/libglut.so
bin/optixMeshViewer: /usr/lib/x86_64-linux-gnu/libOpenGL.so
bin/optixMeshViewer: /usr/lib/x86_64-linux-gnu/libGLX.so
bin/optixMeshViewer: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/optixMeshViewer: /usr/lib/x86_64-linux-gnu/libnvrtc.so
bin/optixMeshViewer: optixMeshViewer/CMakeFiles/optixMeshViewer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/optixMeshViewer"
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optixMeshViewer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
optixMeshViewer/CMakeFiles/optixMeshViewer.dir/build: bin/optixMeshViewer

.PHONY : optixMeshViewer/CMakeFiles/optixMeshViewer.dir/build

optixMeshViewer/CMakeFiles/optixMeshViewer.dir/clean:
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer && $(CMAKE_COMMAND) -P CMakeFiles/optixMeshViewer.dir/cmake_clean.cmake
.PHONY : optixMeshViewer/CMakeFiles/optixMeshViewer.dir/clean

optixMeshViewer/CMakeFiles/optixMeshViewer.dir/depend:
	cd /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer/CMakeFiles/optixMeshViewer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : optixMeshViewer/CMakeFiles/optixMeshViewer.dir/depend

