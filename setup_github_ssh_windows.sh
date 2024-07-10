#!/bin/bash

# Define variables
SSH_DIR="$HOME/.ssh"
CONFIG_FILE="$SSH_DIR/config"
KEY_FILENAME="as_git"
EMAIL="automation@assurance.st"
KEY_PATH="$SSH_DIR/$KEY_FILENAME"

# Ensure the .ssh directory exists
mkdir -p "$SSH_DIR"

# Generate SSH key if it doesn't exist
if [ ! -f "$KEY_PATH" ]; then
    echo "Generating SSH key..."
    ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f "$KEY_PATH" -N ""
    if [ $? -ne 0 ]; then
        echo "Failed to generate SSH key."
        exit 1
    fi

    echo "SSH key generated. Please add the following public key to your GitHub account:"
    cat "$KEY_PATH.pub"
    echo ""
    read -p "Press [Enter] key after adding the key to GitHub..."
else
    echo "SSH key already exists."
fi

# Create or update the SSH config file
echo "Updating SSH config file..."
{
    echo "Host github.com"
    echo "  HostName github.com"
    echo "  User git"
    echo "  IdentityFile $KEY_PATH"
} > "$CONFIG_FILE"

# Set appropriate permissions for the config file
chmod 600 "$CONFIG_FILE"

# Start the SSH agent
echo "Starting the SSH agent..."
eval "$(ssh-agent -s)"
if [ $? -ne 0 ]; then
    echo "Failed to start SSH agent."
    exit 1
fi

# Add the SSH key to the agent
echo "Adding SSH key to the agent..."
ssh-add "$KEY_PATH"
if [ $? -ne 0 ]; then
    echo "Failed to add SSH key to the agent."
    exit 1
fi

# Verify the key is added
echo "Verifying the SSH key..."
ssh-add -l
if [ $? -ne 0 ]; then
    echo "No SSH keys added to the agent."
    exit 1
fi

# Test the SSH connection to GitHub
echo "Testing the SSH connection to GitHub..."
ssh -T git@github.com
if [ $? -ne 0 ]; then
    echo "Failed to authenticate with GitHub."
    exit 1
fi

echo "SSH key setup and GitHub authentication successful."
