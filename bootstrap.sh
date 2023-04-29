#!/bin/bash
HOME=/home/vagrant
PJT_PATH=$HOME/pintos-kaist
ACTIVATE_SCRIPT_PATH=$PJT_PATH/activate

#========================================================
#   Installing and configuring prerequisites for pintos
#========================================================
sudo apt-get install -y software-properties-common && \
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
sudo apt-get update -y && \
sudo apt-get install -y gcc-7 g++-7 qemu make && \
sudo ln -s /usr/bin/gcc-7 /usr/bin/gcc

#========================================================
#   Installing pintos
#========================================================
git clone https://github.com/casys-kaist/pintos-kaist && \
cd $PJT_PATH && source ./activate && \
echo "source $ACTIVATE_SCRIPT_PATH" >> $HOME/.profile 

#========================================================
#   Test pintos
#========================================================
for i in 1 2 3 
do
    echo ">> Number of test attempts : $i"
    cd $PJT_PATH/threads && make clean && make

    if [[ $? -eq 0 ]]; 
    then
        cd $PJT_PATH/threads/build && \
        pintos -k -T 60 -m 20   -- -q  run alarm-single
        break
    fi
done

echo "#####  PINTOS PATH : $PJT_PATH"