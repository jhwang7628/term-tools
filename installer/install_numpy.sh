#!/bin/bash 

# wget -O ../package/Python-2.7.8.tgz https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz
# cd ../package
# tar -xvf Python-2.7.8.tgz 
# cd Python-2.7.8 
# ./configure --prefix=${HOME}/opt
# make 
# make install 

PWD=`pwd`
PYLIB=${HOME}/opt/lib/python2.7

# wget -O ../package/numpy-1.9.2.tar.gz http://sourceforge.net/projects/numpy/files/latest/download
# cd ../package
# tar -xvf numpy-1.9.2.tar.gz
# cd numpy-1.9.2.tar.gz
# python setup.py install --home=${PYLIB}
# cd ${PWD}

BINSCIPY=scipy-0.16.0
wget -O ../package/${BINSCIPY}.tar.gz http://sourceforge.net/projects/scipy/files/latest/download?source=files
cd ../package
tar -xvf ${BINSCIPY}.tar.gz
cd ${BINSCIPY}
python setup.py install --home=${PYLIB}
cd ${PWD}


git clone git@github.com:matplotlib/matplotlib.git ../package/matplotlib
cd ../package/matplotlib
python setup.py install --home=${PYLIB}
cd ${PWD}

