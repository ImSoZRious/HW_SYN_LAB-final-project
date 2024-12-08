from PIL import Image, ImageDraw, ImageFont

charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()_+-=\'"<>?/.,[]{}\\| '

scale = 3

font_size = 16 * scale
padding = 2

image_size = (14 * scale, 20 * scale)

font = ImageFont.truetype("fonts/JetBrainsMono-Regular.ttf", font_size)

def print_image(im):
    width, height = im.size
    for y in range(height):
        for x in range(width):
            p = im.getpixel((x, y))
            if p == 0:
                print("  ", end="")
            else:
                print("xx", end="")
        print()

def add_margin(im, padding, color):
    width, height = im.size
    new_width = width + 2 * padding
    new_height = height + 2 * padding
    result = Image.new(im.mode, (new_width, new_height), color)
    result.paste(im, (padding, padding))
    return result

def create_bitmap(chr):
    image = Image.new("1", size=image_size)
    draw = ImageDraw.Draw(image)
    draw.rectangle([0,0, image_size], fill=(255,))
    draw.text((0, 0), chr, font=font)

    min_x = 1e9
    min_y = 1e9

    max_x = 0
    max_y = 0

    for y in range(image_size[1]):
        for x in range(image_size[0]):
            p = image.getpixel((x, y))
            if p == 0:
                min_x = min(min_x, x)
                min_y = min(min_y, y)
                max_x = max(max_x, x)
                max_y = max(max_y, y)

    new_image = image.crop((min_x, min_y, max_x + 1, max_y + 1))

    padded_image = add_margin(new_image, 2, (255,))

    return padded_image

isize = (32 * len(charset), 64)
image = Image.new("1", size=isize)

draw = ImageDraw.Draw(image)
draw.rectangle([0, 0, isize], fill=(255,))
for i, char in enumerate(charset):
    draw.text((32 * i, 0), char, font=font, features=["-kern"])

def serialize(img):
    i = 0
    v = 0
    out = bytearray()
    for y in range(64):
        for x in range(32):
            p = img.getpixel((x, y))
            v = (v << 1) + int(p == 0)
            i += 1
            if i == 8:
                out.append(v)
                i = 0
                v = 0
    if i > 0:
        out.append(v)

    return out

for i, char in enumerate(charset):
    a = image.crop((32*i, 0, 32*(i+1), 64))
    k = serialize(a)
    g = ''.join(format(byte, "08b") for byte in k)

    print(g[::-1])

