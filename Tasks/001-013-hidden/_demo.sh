#!/bin/bash

clear

# Get the current directory of the script
CURRENT_DIR=$(dirname "${BASH_SOURCE[0]}")

# Load the common script
source $CURRENT_DIR/../../_utils/common.sh

{

echo  -e "<pre>"
# Create 3 direcoties && 3 files
echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "${Yellow}* Creating folders & files${COLOR_OFF}"
echo  -e "$ touch $CURRENT_DIR/{.01,.02,.03}-file.txt"
echo  -e ""
touch $CURRENT_DIR/{.01,.02,.03}-file.txt
ls -la $CURRENT_DIR

rm -rf $CURRENT_DIR/{.01,.02,.03}-file.txt
} 2>&1 | tee $CURRENT_DIR/README.md
