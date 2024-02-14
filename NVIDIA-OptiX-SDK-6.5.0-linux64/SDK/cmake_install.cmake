# Install script for directory: /home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/opal/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixBuffersOfBuffers/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixCallablePrograms/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixCompressedTexture/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixConsole/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixDemandLoadBuffer/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixDemandLoadTexture/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixDenoiser/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixDeviceQuery/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixDynamicGeometry/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixGeometryTriangles/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixHello/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixInstancing/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMDLDisplacement/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMDLExpressions/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMDLSphere/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMeshViewer/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixMotionBlur/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixParticles/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracer/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPathTracerTiled/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixPrimitiveIndexOffsets/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixRaycasting/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixSphere/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixSpherePP/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixTextureSampler/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixTutorial/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/optixWhitted/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/primeInstancing/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/primeMasking/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/primeMultiBuffering/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/primeMultiGpu/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/primeSimple/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/primeSimplePP/cmake_install.cmake")
  include("/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/sutil/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/cavise/1548/NVIDIA-OptiX-SDK-6.5.0-linux64/SDK/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
