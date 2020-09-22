#!/bin/bash

set -eu

pip install -r requirements.txt
pip install -e git+https://github.com/MattShannon/bandmat.git#egg=bandmat
rm -rf src
#pip install -e .

git clone https://github.com/sarulab-speech/jsut-label.git
mkdir -p data/wav
mkdir -p data/label

label_files="./jsut-label/labels/basic5000/*.lab"
for filepath in $label_files; do
    if [ -f $filepath ] ; then
        mv $filepath data/label
    fi
done
rm -rf jsut-label

wget http://ss-takashi.sakura.ne.jp/corpus/jsut_ver1.1.zip
unzip jsut_ver1.1.zip
rm -rf jsut_ver1.1.zip
wav_files="./jsut_ver1.1/basic5000/wav/*.wav"
for filepath in $wav_files; do
    if [ -f $filepath ] ; then
        mv $filepath data/wav
    fi
done
rm -rf jsut_ver1.1
