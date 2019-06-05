SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

python3 init_coco.py

PYTHONPATH=$SCRIPTPATH/lib/dataset_devkit:$PYTHONPATH python3 lib/dataset_devkit/panopticapi/converters/panoptic2semantic_segmentation.py --input_json_file data/coco/annotations/panoptic_train2017_stff.json --segmentations_folder data/coco/annotations/panoptic_train2017 --semantic_seg_folder data/coco/annotations/panoptic_train2017_semantic_trainid_stff --categories_json_file data/coco/annotations/panoptic_coco_categories_stff.json
PYTHONPATH=$SCRIPTPATH/lib/dataset_devkit:$PYTHONPATH python3 lib/dataset_devkit/panopticapi/converters/panoptic2semantic_segmentation.py --input_json_file data/coco/annotations/panoptic_val2017_stff.json --segmentations_folder data/coco/annotations/panoptic_val2017 --semantic_seg_folder data/coco/annotations/panoptic_val2017_semantic_trainid_stff --categories_json_file data/coco/annotations/panoptic_coco_categories_stff.json
