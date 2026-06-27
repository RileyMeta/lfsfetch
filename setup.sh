#!/bin/bash

# When ran normally without arguments:
# create files in /etc/lfsfetch/
# - settings.conf: The user-facing settings
# - REPO_LIST.txt: The list of repositories to search
# Run the program without a package to sort the repo list

# --install:
# Default to /usr/bin unless a location is provided
# Copy the program to the install directory
# chmod a+x "${install_dir}/lfsfetch"

# --clean:
# Re-generate the configuration files in /etc/lfsfetch/

# --uninstall:
# which lfsfetch to obtain the location of the executable
# Remove the executable from the install directory
# Unless an argument is provided loop through /usr/bin/, /bin/, /sbin/, /opt/
# Prompt: Would you like to delete the configuration files?
