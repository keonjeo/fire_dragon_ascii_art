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

# get its file_name_without_suffix_name
file_name=$1
new_file_name=${file_name%.*}

echo "#!/bin/bash --login" > ascii_pictures/$new_file_name.sh
echo "clear" >> ascii_pictures/$new_file_name.sh
echo "cat << \"EOF\"" >> ascii_pictures/$new_file_name.sh

# use the tr bin to filter 'M' character
cat ascii_pictures/temp.txt | tr "M" " " >> ascii_pictures/$new_file_name.sh

echo "EOF" >> ascii_pictures/$new_file_name.sh


# display the ascii art on the screen
cat ascii_pictures/$new_file_name.sh

# change its permission, make it can be executed
chmod a+x ascii_pictures/$new_file_name.sh

# git commands
git add ascii_pictures/$new_file_name.sh
git commit -m "add $new_file_name.sh script into the project"


