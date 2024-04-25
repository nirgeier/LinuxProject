
#!/bin/bash

###
### This scrcipt will create the tests for this repository
### 

# Get the root folder of our demo folder
ROOT_FOLDER=$(git rev-parse --show-toplevel)

# Set the base folder for our tasks
TASKS_FOLDER="$ROOT_FOLDER/Tasks/"

# Search for the foolder to test
demoFiles=$(find $ROOT_FOLDER -name '*_demo.sh' | sort -u)

# Tasks build status file
tasksStatus=$ROOT_FOLDER/tests/README.md

# Write the status file header
echo "| Task  | Build Status |" > $tasksStatus
echo "| -  | - |" >> $tasksStatus

# Loop over the test folders
for file in $demoFiles
do
    # Get the path to the folder
    tasksPath=$(dirname Tasks/${file#$TASKS_FOLDER})

    # Get the path to the folder
    taskId=$(basename $(dirname $file))

    escapedTasksPath=$(echo $tasksPath | sed 's/\//\\\//g')
    # Replace tokens with values and write to a new file
    gsed "s/<TASK_ID>/$taskId/g" ${ROOT_FOLDER}/tests/test-template.yaml  | \
    gsed "s/<TASK_PATH>/$escapedTasksPath/g" > $ROOT_FOLDER/.github/workflows/${taskId}.yaml 
    
    # Clear out the output files, Strip output color from the output
    # Skip errors if any
    gsed -i -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" $TASKS_FOLDER/$taskId/README.md 2>/dev/null || true

    # Add the build status
    echo    "| [$taskId]($tasksPath) " \
            "| <a href="https://github.com/nirgeier/LinuxProject/actions/workflows/${taskId}.yaml">"              \
            "<img src=\"https://github.com/nirgeier/LinuxProject/actions/workflows/${taskId}.yaml/badge.svg\"> "  \
            "</a>" >> $tasksStatus
done

# Format (Beautify) the build status
# You will need to install the following packages
###
### pip install mdformat-gfm
###
mdformat $tasksStatus

pushd . > /dev/null

cd $ROOT_FOLDER/tests/
pwd
# Delete old Tasks content
gsed -i '/<!-- Tasks List -->/,/<!-- Tasks List end -->/{{//!d}}' $ROOT_FOLDER/README.md

# Append the new Tasks content
gsed -i '/<!-- Tasks List -->/r ./README.md' $ROOT_FOLDER/README.md

popd . > /dev/null

# Move the readme to the main Tasks folder
#mv $tasksStatus $ROOT_FOLDER/Tasks/

