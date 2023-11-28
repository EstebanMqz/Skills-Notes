#!/bin/bash

# Description; .json +w .py mode to transform .json into UI .md readable file for Perl regex Tags extraction & deprecated tests are made from: " (?<=-\s\s)\w[\w\s-]* "
# Regex Expression matching word inline chars starting with '-  ' & in-between '-'
# Tags transformations piped into web searches & new markdown hyperlinks elements replaced in skills Tags @ README.md  

#Perl-enabled words inline regex searches > output
grep -oP '(?<=\s\s-\s#)\w[{'$var[$1]'}]*' README.md 

#LinkedIn Tags -> web transformations xargs elements > echo pipes.
cat tags.txt | sed 's/[\/-]/%20/g' | xargs -I{} echo "https://www.linkedin.com/search/results/all/?keywords={}%20&origin=GLOBAL_SEARCH_HEADER&sid" > web.txt 

# #Markdown awk Tags/Skills extractions (web-regex.md) to-parse -> (test.md) URL formatted URLs & tests (rm tests).
paste tags.txt web.txt | awk '{print "["$1"]("$2")"}' | tee web-regex.md & rm tags.txt web.txt && rm tags.txt web.txt 

# # #Have the web-regex.md Tags/Skills parsed back within matching 
# declare -A map
# while IFS= read -r line; do
#     $key = $($line | cut -d' ' -f1)
#     $value =$($line | cut -d' ' -f2-)
#     echo $key
#     echo $value
#     $value = $var[$key]
#     $sed 's/[\/-]/%20/g'
#     echo {[$key][$value]}Q!A

# done

# grep -oP '(?<=\s\s-\s#)\w[\w\s-/]*' README.md | sed 's/[\/-]/%20/g' | xargs -I{} echo "https://www.linkedin.com/search/results/all/?keywords={}%20&origin=GLOBAL_SEARCH_HEADER&sid" > web.txt && echo ${map["key"]}
