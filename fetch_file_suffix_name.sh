#!/bin/bash --login

# Usage:
# ./fetch_file_suffix_name.sh hello.rb
#
# Output:
#  file name is: hello

file_name=$1
name=${file_name%.*}

echo ========================
echo   file name is: $name
echo ========================
