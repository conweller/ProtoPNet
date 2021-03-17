pip install Augmentor
pip install gdown

gdown --id 1hbzc_P1FuxMkcabkgn9ZKinBwW683j45 --output CUB_200_2011.tgz

tar -xf CUB_200_2011.tgz

python3 crop.py

python3 img_aug.py
