inkscape logo.svg --export-dpi=600 --export-type=png --export-filename=temp.png
convert -quality 100 temp.png logo.jpg
rm temp.png
