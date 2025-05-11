from PIL import Image

# Open the BMP image
input_image_path = 'prayingv2.bmp'  # Change this to your BMP file path
image = Image.open(input_image_path)

# Ensure the image is in 1-bit mode (binary image)
if image.mode != '1':
    image = image.convert('1')  # Convert to 1-bit (binary) image

# Get the image dimensions
width, height = image.size

# Open the output file for writing
output_file_path = 'output.txt'  # Change this to your desired output file path
with open(output_file_path, 'w') as output_file:
    # Iterate over each pixel
    for y in range(height):
        for x in range(width):
            pixel = image.getpixel((x, y))
            # 1 for white, 0 for black (in a 1-bit image, pixel is either 0 or 255)
            output_file.write('1' if pixel == 255 else '0')
            output_file.write(',')
        # Newline after each row
        output_file.write('\n')

print(f"Process complete! Check the output file: {output_file_path}")
