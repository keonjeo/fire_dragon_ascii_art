#!/bin/bash --login

clear

if [ ! -d "ascii_pictures" ];then
  mkdir ascii_pictures
else
  echo "The ascii_pictures directory has been existing in your system."
fi

# execute this command to generate the ascii art
# Usage:
#    jp2a picture_file_name
#
# Note: picture_file_name should be existed in the picture directory
jp2a "pictures"/$1 > ascii_pictures/temp.txt

# use the tr bin to filter 'M' character
cat ascii_pictures/temp.txt | tr "M" " "

