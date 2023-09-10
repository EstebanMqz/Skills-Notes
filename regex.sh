#!/bin/bash
# .json +w .py mode to transform .json into UI .md readable file for Perl regex Tags extraction & deprecated tests are made from: " (?<=-\s\s)\w[\w\s-]* "
# Regex Expression matching word inline chars starting with '-  ' & in-between '-'
# Tags transformations piped into web searches & new markdown hyperlinks elements replaced in skills Tags @ README.md  

#Perl-enabled words inline regex searches > output
grep -oP '(?<=\s\s-\s#)\w[\w\s-/]*' README.md > tags.txt

#LinkedIn Tags -> web transformations xargs elements > echo pipes.
cat tags.txt | sed 's/[\/-]/%20/g' | xargs -I{} echo "https://www.linkedin.com/search/results/all/?keywords={}%20&origin=GLOBAL_SEARCH_HEADER&sid" > web.txt 

#Markdown awk print format hyperlinks & testing. 
paste tags.txt web.txt | awk '{print "["$1"]("$2")"}' | tee web-regex.md && rm tags.txt web.txt 
code --reuse-window "web-regex.md"




