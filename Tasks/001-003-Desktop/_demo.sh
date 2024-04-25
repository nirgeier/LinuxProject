#!/bin/bash

clear

# Get the current directory of the script
CURRENT_DIR=$(dirname "${BASH_SOURCE[0]}")

# Load the common script
source $CURRENT_DIR/../../_utils/common.sh

{
echo -e "<pre>"

cd ~
echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "${Green}Current directory: $(pwd)"

ls -la 

echo -e "<pre>"

} 2>&1 | tee $CURRENT_DIR/README.md
