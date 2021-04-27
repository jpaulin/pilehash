#!/bin/bash

# Prints a footer (signature) of the tool itself
myfinger () {
    echo "pilehash v0.1"
}

#
myfinger
#
# Calculate, this just takes a count of items that will be included in hash
hn=`find . -type f -print0 | sort -z | xargs -0 sha1sum | awk '{print $1;}' | wc -l`
echo "Having ${hn} items in the folder, including files and folders"
echo "The SHA1SUM is:"
# For each item, show internally a hash, which will then be calculated into
# the main (final) hash
snh=`find . -type f -print0 | sort -z | xargs -0 sha1sum | awk '{print $1;}' | sha1sum`
# Take away the trailing '-' that would be printed for STDIN (as parameter of sha1sum)
# So what is left, is only the digest (hash). Show this in console.
echo "${snh}" | awk '{print $1;}'
