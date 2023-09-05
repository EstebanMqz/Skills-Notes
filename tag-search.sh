#!/bin/bash
# Description: This script will search for a tag in the README.md file and replace it with a web-search.

grep -oP '(?<=##\s\d\.\s)[\w\s]+' README.md > test.txt && code --reuse-window "test.txt" #1-9 only extraction.