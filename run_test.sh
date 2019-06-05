#!/bin/bash

# Run val2017 with 10 testing images
# resnet101
python3.6 upsnet/upsnet_end2end_test.py --cfg upsnet/experiments/upsnet_resnet101_test.yaml --weight_path model/upsnet_resnet_101_dcn_coco_270000.pth

rm -rfv upsnet/experiments/upsnet_resnet101_test.yaml
mv -fv upsnet/experiments/upsnet_resnet101_test_notvls.yaml upsnet/experiments/upsnet_resnet101_test.yaml

python3.6 upsnet/upsnet_end2end_test.py --cfg upsnet/experiments/upsnet_resnet101_test.yaml --weight_path model/upsnet_resnet_101_dcn_coco_270000.pth

# resnet50
python3.6 upsnet/upsnet_end2end_test.py --cfg upsnet/experiments/upsnet_resnet50_test.yaml --weight_path model/upsnet_resnet_50_coco_90000.pth

rm -rfv upsnet/experiments/upsnet_resnet50_test.yaml 
mv -fv upsnet/experiments/upsnet_resnet50_test_notvls.yaml upsnet/experiments/upsnet_resnet50_test.yaml 

python3.6 upsnet/upsnet_end2end_test.py --cfg upsnet/experiments/upsnet_resnet50_test.yaml --weight_path model/upsnet_resnet_50_coco_90000.pth


# Rename data directory
mv -fv data/coco/images/val2017 data/coco/images/val2017test
mv -fv data/coco/images/val2017orig data/coco/images/val2017


# Run original val2017
# resnet101
python3.6 upsnet/upsnet_end2end_test.py --cfg upsnet/experiments/upsnet_resnet101_dcn_coco_3x_16gpu.yaml --weight_path model/upsnet_resnet_101_dcn_coco_270000.pth

rm -rfv upsnet/experiments/upsnet_resnet101_dcn_coco_3x_16gpu.yaml
mv -fv upsnet/experiments/upsnet_resnet101_dcn_coco_3x_16gpu_notvls.yaml upsnet/experiments/upsnet_resnet101_dcn_coco_3x_16gpu.yaml

python3.6 upsnet/upsnet_end2end_test.py --cfg upsnet/experiments/upsnet_resnet101_dcn_coco_3x_16gpu.yaml --weight_path model/upsnet_resnet_101_dcn_coco_270000.pth

# resnet50
python3.6 upsnet/upsnet_end2end_test.py --cfg upsnet/experiments/upsnet_resnet50_coco_16gpu.yaml --weight_path model/upsnet_resnet_50_coco_90000.pth

rm -rfv upsnet/experiments/upsnet_resnet50_coco_16gpu.yaml
mv -fv upsnet/experiments/upsnet_resnet50_coco_16gpu_notvls.yaml upsnet/experiments/upsnet_resnet50_coco_16gpu.yaml

python3.6 upsnet/upsnet_end2end_test.py --cfg upsnet/experiments/upsnet_resnet50_coco_16gpu.yaml --weight_path model/upsnet_resnet_50_coco_90000.pth


# Rename data directory
mv -fv data/coco/images/val2017 data/coco/images/val2017orig
mv -fv data/coco/images/val2017test data/coco/images/val2017

