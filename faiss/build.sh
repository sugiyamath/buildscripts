#!/bin/bash
apt install libopenblas-dev python3-dev swig gcc g++ gfortran
pip3 install numpy
git clone https://github.com/sugiyamath/faiss
cd faiss
cmake -DFAISS_ENABLE_GPU=OFF -DFAISS_ENABLE_PYTHON=ON -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DPython_EXECUTABLE=/usr/bin/python3 -B build .
make -C build -j faiss
make -C build -j swigfaiss
make -C build install
cd build/faiss/python && python3 setup.py install
