#!/bin/bash

# Source directories to back up
source_directories=("/Students" "/Staff")

# Specify the new backup directory path within your user's home directory
backup_dir="$HOME/backup"

# Create the backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
	   mkdir -p "$backup_dir"
	      echo "Created backup directory: $backup_dir"
fi

# Create a timestamp
timestamp=$(date +"%Y%m%d%H%M%S")

# Loop through source directories and back up each
for dir in "${source_directories[@]}"; do
	   if [ -d "$dir" ]; then
		          # Backup the directory to the backup directory with a timestamp
			         backup_name="$(basename "$dir")_$timestamp"
				        sudo cp -r "$dir" "$backup_dir/$backup_name"
					       echo "Backed up '$dir' to '$backup_dir/$backup_name'"
					          else
							         echo "Error: '$dir' does not exist or is not a directory."
								    fi
							    done

