#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Test the OS if Debian or macOS
os_name="$(uname -s)"
if [[ "$os_name" == "Linux" ]]; then
    if [ -f /etc/debian_version ]; then
        echo "Operating System: Debian-based Linux"
    else
        echo "This script only supports Debian-based Linux and macOS."
        exit 1
    fi
elif [[ "$os_name" == "Darwin" ]]; then
    echo "Operating System: macOS"
else
    echo "This script only supports Debian-based Linux and macOS."
    exit 1
fi

# Check if curl or wget is available
if command_exists curl; then
    echo "curl is available"
    downloader="curl -O"
elif command_exists wget; then
    echo "wget is available"
    downloader="wget"
else
    echo "Neither curl nor wget is available. Please install one of them."
    exit 1
fi

# Retrieve the Dockerfile
echo "Retrieving the Dockerfile..."
$downloader https://raw.githubusercontent.com/SyNode-IT/nmap-viewer/refs/heads/master/docker/Dockerfile

if [[ ! -f Dockerfile ]]; then
    echo "Failed to download Dockerfile."
    exit 1
fi

# Build the Docker image
echo "Building the Docker image..."
docker build -t nmap-viewer .

if [[ $? -ne 0 ]]; then
    echo "Docker build failed."
    exit 1
fi

# Run the Docker container
echo "Running the Docker container on port 3001..."
docker run --name nmap-viewer -p 3001:3001 nmap-viewer &
