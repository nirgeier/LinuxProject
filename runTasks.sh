#!/bin/bash

# Get the root folder of our demo folder
ROOT_FOLDER=$(git rev-parse --show-toplevel)

# Run the demo
cd $ROOT_FOLDER/Docker

# Start the docker container
docker-compose up -d --build

# Switch to the root folder
cd $ROOT_FOLDER/docker

# Set the base folder for our tasks
TASKS_FOLDER="$ROOT_FOLDER/Tasks/"

# Find the folders with the _demo.sh script
demoFiles=$(find $ROOT_FOLDER -name '*_demo.sh' | sort -u)

for demoFile in $demoFiles
do
  # Get the path to the folder
  tasksPath=$(dirname Tasks/${demoFile#$TASKS_FOLDER})
  
  # Execute the task in the docker contaienr
  docker exec -it ubuntu-cyber-course bash $tasksPath/_demo.sh
done

# Clear the README files
git hook run pre-commit  