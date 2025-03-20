#!/bin/bash

# Function to find and push all repositories recursively
push_repos() {
  local parent_dir=$1
  for dir in "$parent_dir"/*; do
    if [ -d "$dir/.git" ]; then
      echo "Pushing repository: $dir"
      (cd "$dir" && git push)
    elif [ -d "$dir" ]; then
      # Recursively call the function for nested directories
      push_repos "$dir"
    fi
  done
}

# Push the root repository first
echo "Pushing root repository..."
git push

# Set the root directory for sub-repos
ROOT_DIR="packages"

# Start pushing sub-repositories
push_repos "$ROOT_DIR"

echo "All repositories pushed!"
