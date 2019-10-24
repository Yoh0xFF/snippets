#!/bin/sh

# find .          Instructs the find program to search for files in the current directory
# -name "target"  Instructs the find program to search for files named "target"
# -type d         Instructs the find program to only look for file directories named "target"
# -prune          Instructs the find program to not descend into the current file/directory for it to exclude child "target" directories
# -exec rm -rf    Instructs the find program to execute rm -rf on the matching results
# '{}' +          Instructs the command line to be built by appending each selected file name at the end thus invoking the rm -rf command less times than the total number of "target" directory matches
find . -name "target" -type d -prune -exec rm -rf '{}' +
