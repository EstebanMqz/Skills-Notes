#!/bin/bash

# Define an associative array to hold the mapping from text to hyperlink
declare -A map

# Populate the associative array with the mapping from web-regex.md
while IFS= read -r line; do
    key=$(echo $line | cut -d' ' -f1)
    value=$(echo $line | cut -d' ' -f2-)
    echo $map["$key"]=$value
    awk -v key="$key" -v value="$value" '{gsub(key, value); print}' README.md > temp && mv temp README.md
done < web-regex.md
# done < web-regex.md

# Replace the text with hyperlinks in README.md
# for key in "${!map[@]}"; do
#     echo "sed -i "s/$key/${map[$key]}/g" README.md"
# done
# # Escape special characters in the replacement string
# for key in "${!map[@]}"; do
#     map[$key]=$(echo "${map[$key]}" | sed -e 's/[\/&]/\\&/g')
# done

# # Replace the text with hyperlinks in README.md
# for key in "${!map[@]}"; do
#     sed --regexp-extended -i "s/$key/${map[$key]}/g" "C:/Users/Esteban/Desktop/Projects/Github/Repos_To-do/Languages/Other/Repositories/Skills-Notes/README.md"
# done

# sed --regexp-extended 's/(\s\s-\s#)(\w[\w\s-]*)/\1\2/g' README.md
# read web-regex.md