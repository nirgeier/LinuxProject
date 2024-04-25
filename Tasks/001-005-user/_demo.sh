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
echo  -e "${Yellow}Current User: (1)${COLOR_OFF}"
echo  -e "${Green}$ id${COLOR_OFF}"
id

echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "${Green}Current User: (2)${COLOR_OFF}"
echo  -e "${Green}$ whoami${COLOR_OFF}"
whoami

echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "${Green}Current User: (3)${COLOR_OFF}"
echo  -e "${Cyan}$ who${COLOR_OFF}"
who

echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "${Green}Current User: (4)${COLOR_OFF}"
echo  -e "${Green}$ logname${COLOR_OFF}"
logname

echo  -e "${Yellow}----------------------------------------------------------------${COLOR_OFF}"
echo  -e "${Green}Current User: (4)${COLOR_OFF}"
echo  -e "${Green}$ echo $USER${COLOR_OFF}"
echo $USER

echo -e "<pre>"

} 2>&1 | tee $CURRENT_DIR/README.md
