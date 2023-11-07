#!/bin/bash
# .json +w .py mode to transform .json into UI .md readable file for Perl regex Tags extraction & deprecated tests are made from: " (?<=-\s\s)\w[\w\s-]* "
# Regex Expression matching word inline chars starting with '-  ' & in-between '-'
# Tags transformations piped into web searches & new markdown hyperlinks elements replaced in skills Tags @ README.md  

#Perl-enabled words inline regex searches > output
grep -oP '(?<=\s\s-\s#)\w[\w\s-/]*' README.md > tags.txt

#LinkedIn Tags -> web transformations xargs elements > echo pipes.
cat tags.txt | sed 's/[\/-]/%20/g' | xargs -I{} echo "https://www.linkedin.com/search/results/all/?keywords={}%20&origin=GLOBAL_SEARCH_HEADER&sid" > web.txt 

#Markdown awk Tags/Skills extractions (web-regex.md) to-parse -> (test.md) URL formatted URLs & tests (rm tests).
paste tags.txt web.txt | awk '{print "["$1"]("$2")"}' | tee web-regex.md && rm tags.txt web.txt 

#Have matching Tags/Skills web-regex.md -> TEST.MD parsed back to an hyperlimked README.md.  
awk '/^\s\s-\s#/ {print "["$2"]("$3")"}' README.md > test.md


#Data-Mining
# LinkedIn Web-Scrapping hyperlink e.g: "https://www.linkedin.com/jobs/search/?keywords=<tag1>%20<tag2>&location=<location1>%20<location2>&refresh=true"
