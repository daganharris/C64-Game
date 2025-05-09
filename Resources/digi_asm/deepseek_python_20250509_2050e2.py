import re

# Read the input file
with open("3_2_1_go.asm", "r") as f:
    content = f.read()

# Extract all hex values (e.g., $11, $F1, etc.)
hex_values = re.findall(r'\$([0-9A-Fa-f]{2})', content)

# Convert hex strings to bytes
binary_data = bytes([int(x, 16) for x in hex_values])

# Write to a .bin file
with open("output.bin", "wb") as f:
    f.write(binary_data)

print(f"Converted {len(binary_data)} bytes to output.bin")