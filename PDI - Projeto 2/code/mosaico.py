import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import os

# List of image files in descending order of gray levels
levels = [128, 64, 32, 16, 8, 4, 2]
file_paths = [f"../results/drip-bottle-{lvl}.tif" for lvl in levels]

# Read images
images = [mpimg.imread(fp) for fp in file_paths]

# Create a 2x4 subplot figure
fig, axes = plt.subplots(2, 4, figsize=(12, 6))

# Plot images
for idx, ax in enumerate(axes.flatten()):
    if idx < len(images):
        ax.imshow(images[idx], cmap='gray')
        ax.set_title(f'{levels[idx]} levels')
    ax.axis('off')

# Adjust layout and save
plt.tight_layout()
output_path = '../results/drip-bottle-montage.jpg'
plt.savefig(output_path, dpi=300)
plt.show()

print(f"Saved mosaic to {output_path}")