#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build --tag=shovon_capstone_project .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
docker run -p 3200:3200 shovon_capstone_project

#Running background
#docker run -d --name shovon_capstone_project -p 3200:3200 shovon_capstone_project
