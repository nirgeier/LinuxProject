#!/bin/bash

clear


# Get the current directory of the script
CURRENT_DIR=$(dirname "${BASH_SOURCE[0]}")

# Load the common script
source $CURRENT_DIR/../../_utils/common.sh

function listFiles(){
  # Check to see if we have the desired output directories
  echo  -e "${Green}Output:"
  tree $PLAYGROUND_FOLDER
  echo  -e "${COLOR_OFF}"
}

{
echo -e "<pre>"
# Switch to the playground folder
echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "${Yellow}Setting up playground folders${COLOR_OFF}"
rm    -rf $PLAYGROUND_FOLDER
mkdir  -p $PLAYGROUND_FOLDER
cd        $PLAYGROUND_FOLDER

# Create 3 direcoties && 3 files
echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "${Yellow}* Creating folders & files${COLOR_OFF}"
echo  -e "$ mkdir -p {dir1,dir2,dir3} && touch {01,02,03}-file\$RANDOM.txt"
echo  -e ""
mkdir -p {dir1,dir2,dir3} && touch {01,02,03}-file$RANDOM.txt

# Check to see if we have the desired output directories
listFiles

# Move the files to a given directory
echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "${Yellow}* Finding and moving files${COLOR_OFF}"
echo  -e "$ find $PLAYGROUND_FOLDER -name "*.txt" -exec mv {} "$PLAYGROUND_FOLDER/dir1""
echo  -e ""
find  $PLAYGROUND_FOLDER  \
      -name "*.txt"       \
      -exec mv {} "$PLAYGROUND_FOLDER/dir1" \;  2>/dev/null

# Check to see if we have the desired output directories
listFiles

echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "$ cd $PLAYGROUND_FOLDER/dir1"
echo  -e ""
cd $PLAYGROUND_FOLDER/dir1

# Move the files to a diffrence directory
echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "${Yellow}* Finding and moving files${COLOR_OFF}"
echo  -e "$ find $PLAYGROUND_FOLDER -name "*.txt" -exec mv {} "$PLAYGROUND_FOLDER/dir2""
echo  -e ""
find  $PLAYGROUND_FOLDER  \
      -name "*.txt"       \
      -exec mv {} "$PLAYGROUND_FOLDER/dir2" \;  2>/dev/null

# Check to see if we have the desired output directories
listFiles

echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "${Yellow}* Delete the files from the directory${COLOR_OFF}"
echo  -e "$ find $PLAYGROUND_FOLDER -name "*.txt" -exec rm {} "$PLAYGROUND_FOLDER/dir2""
echo  -e ""
find  $PLAYGROUND_FOLDER  \
      -name "*.txt"       \
      -exec rm {} "$PLAYGROUND_FOLDER/dir2" \;  2>/dev/null

# Check to see if we have the desired output directories
listFiles

echo -e "</pre>"
} 2>&1 | tee $CURRENT_DIR/README.md
