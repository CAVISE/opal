Requirements:

1. CUDA 10.1 

To install:

sudo apt install nvidia-cuda-toolkit

To check that you install successfully, input:
nvcc --version

2. Cmake 3.10 (may work with other version, but we recommend this)

3. Glut

sudo apt-get install freeglut3-dev

4. gcc 7.5.0

To decrease version

sudo apt remove gcc
sudo apt-get install gcc-7 g++-7 -y
sudo ln -s /usr/bin/gcc-7 /usr/bin/gcc
sudo ln -s /usr/bin/g++-7 /usr/bin/g++
sudo ln -s /usr/bin/gcc-7 /usr/bin/cc
sudo ln -s /usr/bin/g++-7 /usr/bin/c++

Now you can run a simple simulation in Opal. For this you need to open terminal inside SDK/bin (after cloning this repository) and type this:

./opal -r 10 -u 0.1 -c -d -m
