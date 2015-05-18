# Stamps postmark from Deutsche Post eFiliale to your LaTeX letter.
#
# Usage:
#   Goto https://www.efiliale.de
#   Select "Standardbrief"
#   Select "Mit Adresse(n)"
#   Download the generated PDF
#   ./stamp.sh ~/downloads/postmark.pdf


if [[ $@ -ne 1 ]]; then
  echo "Usage: $0 postmark_file"
  exit 1
fi

postmark_file=$1

# DIN A4:
# 595 points width  == 210 millimeters
# 842 points height == 297 millimeters
left=141
bottom=698
right=250
top=738

# Crop postmark
gs -o postmark_cropped.pdf \
   -sDEVICE=pdfwrite \
   -c "[/CropBox [$left $bottom $right $top]" \
   -c " /PAGES pdfmark" \
   -f $postmark_file \

# Position postmark
pdfjam -o postmark_clean.pdf \
  --a4paper \
  --scale 0.16 \
  --offset '-25mm 90mm' \
  postmark_cropped.pdf

# Stamp postmark
pdftk letter.pdf stamp postmark_clean.pdf output letter-stamped.pdf

# Remove useless files
rm postmark_clean.pdf postmark_cropped.pdf
