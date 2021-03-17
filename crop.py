from PIL import Image

cub_dir = "CUB_200_2011/CUB_200_2011"
img_dir = f"{cub_dir}/images"
crop_dir = "datasets/cub200_cropped"

with open(f"{cub_dir}/images.txt", 'r') as idx_file, open(
        f"{cub_dir}/bounding_boxes.txt",
        'r') as box_file, open(f"{cub_dir}/train_test_split.txt",
                               'r') as train_file:
    for idx_line, box_line, train_line in zip(idx_file, box_file, train_file):
        img_fname = idx_line.split()[1]
        l, t, w, h = map(float, box_line.split()[1:])
        r, b = l + w, t + h
        train = train_line.split()[1] == '1'
        img = Image.open(f"{img_dir}/{img_fname}")
        crop = img.crop((l, t, r, b))
        out_dir = f"{crop_dir}/{'train_cropped' if train else 'test_cropped'}"
        crop.save(f"{out_dir}/{img_fname}")
