#!/bin/bash

# Check if argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <svg_file>"
    echo "Example: $0 logo.svg"
    exit 1
fi

# Get the input file
input_file="$1"

# Check if file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found"
    exit 1
fi

# Check if file has .svg extension
if [[ "$input_file" != *.svg ]]; then
    echo "Error: File must have .svg extension"
    exit 1
fi

# Get filename without extension
filename="${input_file%.*}"

# Create output filename
output_file="${filename}.jpg"

echo "Converting $input_file to $output_file..."

# Convert SVG to PNG then to JPG
inkscape "$input_file" --export-dpi=600 --export-type=png --export-filename=temp.png
magick -quality 100 temp.png "$output_file"
rm temp.png

echo "Conversion complete: $output_file"