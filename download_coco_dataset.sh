#!/bin/bash
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

mkdir -p data/coco

if [ ! -f "./annotations_trainval2017.zip" ] ; then
        echo -e "Downloading 2017 Train/Val annotations [241MB]"
        wget -c http://images.cocodataset.org/annotations/annotations_trainval2017.zip
        
        echo -e "\nUnzipping dataset"
        unzip annotations_trainval2017.zip -d ./data/coco
fi

cd "$SCRIPTPATH"

if [ ! -f "./panoptic_annotations_trainval2017.zip" ] ; then
        echo -e "Downloading 2017 Panoptic Train/Val annotations [821MB]"
        wget -c http://images.cocodataset.org/annotations/panoptic_annotations_trainval2017.zip
        
        echo -e "\nUnzipping dataset"
        unzip panoptic_annotations_trainval2017.zip -d ./data/coco
        rm -rfv ./data/coco/__MACOSX ./data/coco/annotations/.DS_Store

        cd ./data/coco/annotations
        unzip panoptic_train2017.zip -d ./
        unzip panoptic_val2017.zip -d ./
        rm -rfv *.zip
fi

cd "$SCRIPTPATH"

if [ ! -f "./val2017.zip" ] ; then
        echo -e "Downloading 2017 Val images [5K/1GB]"
        wget -c http://images.cocodataset.org/zips/val2017.zip
        
        echo -e "\nUnzipping dataset"
        unzip val2017.zip -d ./data/coco
        mkdir -p ./data/coco/images
        mv -fv ./data/coco/val2017 ./data/coco/images/val2017
fi

cd "$SCRIPTPATH"

if [ ! -f "./train2017.zip" ] ; then
        echo -e "Downloading 2017 Train images [118K/18GB]"
        wget -c http://images.cocodataset.org/zips/train2017.zip
        
        echo -e "\nUnzipping dataset"
        unzip train2017.zip -d ./data/coco
        mkdir -p ./data/coco/images
        mv -fv ./data/coco/train2017 ./data/coco/images/train2017
fi

echo -e "Finish downloading COCO panoptic dataset"
