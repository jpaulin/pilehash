#!/bin/bash

# Be careful with booleanish testing in bash
# See article about it:
# https://linuxize.com/post/how-to-compare-strings-in-bash/
#
# If set to False, the script gives minimal (hash) output only.
# True shows all kinds of other things, such as count of files.
allowVerbose="False"
# The testing shall be exactly "$allowVerbose" = "true" for positive test

# Prints a footer (signature) of the tool itself
printMySig () {
    echo "pilehash v0.1.1"
}

# Options handling. 
#   Options affects how the script executes.
#   Verbosity of output to console.
#   Etc..

if [ "$allowVerbose" = "true" ]; then
    printMySig
fi

#
# Calculate, this just takes a count of items that will be included in hash
if [ "$allowVerbose" = "true" ]; then
    hn=`find . -type f -print0 | sort -z | xargs -0 sha1sum | awk '{print $1;}' | wc -l`
    echo "Having ${hn} items in the folder, including files and folders"
    echo "The SHA1SUM is:"
fi
    # For each item, show internally a hash, which will then be calculated into
# the main (final) hash
snh=`find . -type f -print0 | sort -z | xargs -0 sha1sum | awk '{print $1;}' | sha1sum`
# Take away the trailing '-' that would be printed for STDIN (as parameter of sha1sum)
# So what is left, is only the digest (hash). Show this in console.
echo "${snh}" | awk '{print $1;}'


