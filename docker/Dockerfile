# FROM defines the base image
# FROM ubuntu16.04
# FROM ubuntu:latest
# FROM nvidia/cudagl:10.1-devel-ubuntu16.04
FROM pytorch/pytorch:1.1.0-cuda10.0-cudnn7.5-devel

#Update apt-get and upgrade
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y upgrade

RUN apt-get -y install python3-pip vim
RUN pip3 install pip --upgrade
RUN pip install numpy cython
RUN pip install pycocotools
RUN pip3 install numpy cython
RUN pip3 install pycocotools

RUN conda install -y -c conda-forge tensorboardx opencv easydict matplotlib
RUN conda install -y -c anaconda scipy networkx
RUN conda install -y -c qiqiao horovod

RUN apt update && apt install -y libgl1-mesa-glx libopenmpi-dev && apt -y upgrade

WORKDIR /root

