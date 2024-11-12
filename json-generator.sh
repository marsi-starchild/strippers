#!/bin/bash

directory=./videos

if [ ! -d $directory ]; then
    echo "Directory does not exist."
    exit 1
fi

file_list=()


for file in "$directory"/*; do
    if [ -f "$file" ]; then
        file_list+=("$(basename "$file")")
    fi
done

if [ ${#file_list[@]} -gt 0 ]; then
    json=$(printf '%s\n' "${file_list[@]}" | jq -R . | jq -s .)
    echo "$json" > videos.json
    echo "videos.json has been created successfully."
else
    echo "No file in directory."
fi
