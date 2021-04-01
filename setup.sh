#!/usr/bin/env bash

echo "Downloading Base Dataset"

gdown --id 1hbzc_P1FuxMkcabkgn9ZKinBwW683j45 --output CUB_200_2011.tgz

tar -xf CUB_200_2011.tgz

mkdir datasets
mkdir datasets/cub200_cropped/
mkdir datasets/cub200_cropped/test_cropped
mkdir datasets/cub200_cropped/train_cropped

for dir in $(ls CUB_200_2011/images); do
    mkdir datasets/cub200_cropped/test_cropped/$dir
    mkdir datasets/cub200_cropped/train_cropped/$dir
done


echo "Cropping Images"

python3 crop.py

echo "Constructing Augmented Images"

python3 img_aug.py
