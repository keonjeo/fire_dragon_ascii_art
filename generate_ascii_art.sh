#!/bin/bash --login

clear

if [ ! -d "ascii_pictures" ];then
  mkdir ascii_pictures
else
  echo "The ascii_pictures directory has been existing in your system."
fi

jp2a "pictures"/$1
