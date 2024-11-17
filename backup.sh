#!/bin/bash

# Programming Assignment 4: Linux Shell Scripting
# Name: Mansi Sanghvi
#
# Description:
# This script backs up files from a source directory to a destination directory,
# copying only those files that have been modified since the last backup.
# It ignores subdirectories and requires two arguments:
# 1. The source directory path
# 2. The destination directory path
#
# Usage:
# ./backup.sh <source_directory> <destination_directory>

# Check if exactly two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

src_dir=$1
dest_dir=$2

# Check if source directory exists
if [ ! -d "$src_dir" ]; then
    echo "Error: Source directory does not exist: $src_dir"
    exit 1
fi

# Create destination directory if it does not exist
mkdir -p "$dest_dir"

# Iterate through files in the source directory
for file in "$src_dir"/*; do
    # Skip if it's a directory
    if [ -d "$file" ]; then
        continue
    fi

    # Get the filename from the path
    filename=$(basename "$file")
    dest_file="$dest_dir/$filename"

    # Copy the file if it does not exist in the destination or if modified
    if [ ! -e "$dest_file" ] || [ "$file" -nt "$dest_file" ]; then
        echo "Copying $file to $dest_file"
        cp "$file" "$dest_file"
    fi
done

echo "Backup completed successfully."
