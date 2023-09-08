#!/bin/bash
# Description: Perl regex Tags extraction & test.txt creation / VSCode testing (deprecated: history ✓) from: " (?<=-\s\s)\w[\w\s-]* ":
# Regex Expression matching word inline chars starting with '-  ' & in-between '-' for web metadata extraction optimizations.

#Perl-enabled words inline regex searches > output
grep -oP '(?<=-\s\s)\w[\w\s-]*' README.md > tags.txt   

#LinkedIn Tags -> web transformations xargs elements > echo pipes.
cat tags.txt | sed 's/-/%20/g' | xargs -I{} echo "https://www.linkedin.com/search/results/all/?keywords={}%20&origin=GLOBAL_SEARCH_HEADER&sid" > web.txt && code --reuse-window "web.txt"

# Regex websearch (pending)
#Construct web searches using xdg-open for tags.txt element(s) using web.txt URLS corresponding inlines xdg-open.


