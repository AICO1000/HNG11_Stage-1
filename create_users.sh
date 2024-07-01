#!/bin/bash

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root." >&2
    exit 1
fi

# Check if the file argument is provided
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <name-of-text-file>" >&2
    exit 1
fi

# Assign file argument to a variable
FILE=$1

# Check if the file exists
if [[ ! -f $FILE ]]; then
    echo "File not found: $FILE" >&2
    exit 1
fi

# Log and password file locations
LOGFILE="/var/log/user_management.log"
PASSFILE="/var/secure/user_passwords.csv"

# Create/clear the log file and set permissions
touch $LOGFILE
chmod 644 $LOGFILE

# Create/clear the password file and set secure permissions
mkdir -p /var/secure
touch $PASSFILE
chmod 600 $PASSFILE

# Function to generate a random password
generate_password() {
    tr -dc A-Za-z0-9 </dev/urandom | head -c 16
}

# Read the input file line by line
while IFS=';' read -r username groups; do
    # Remove any leading or trailing whitespace
    username=$(echo "$username" | xargs)
    groups=$(echo "$groups" | xargs)

    # Create a group with the same name as the username if it doesn't exist
    if ! getent group "$username" &>/dev/null; then
        groupadd "$username" 2>>$LOGFILE
        if [[ $? -ne 0 ]]; then
            echo "Failed to create group $username" | tee -a $LOGFILE
            continue
        fi
    fi

    # Check if user already exists
    if id "$username" &>/dev/null; then
        echo "User $username already exists, skipping..." | tee -a $LOGFILE
        continue
    fi

    # Create user with home directory and user-specific group
    useradd -m -g "$username" "$username" 2>>$LOGFILE
    if [[ $? -ne 0 ]]; then
        echo "Failed to create user $username" | tee -a $LOGFILE
        continue
    fi

    # Generate a random password
    password=$(generate_password)
    echo "$username:$password" | chpasswd
    echo "$username,$password" >> $PASSFILE

    # Assign additional groups if specified
    if [[ -n $groups ]]; then
        IFS=',' read -ra ADDR <<< "$groups"
        for group in "${ADDR[@]}"; do
            group=$(echo "$group" | xargs)
            # Check if group exists, if not create it
            if ! getent group "$group" &>/dev/null; then
                groupadd "$group" 2>>$LOGFILE
            fi
            usermod -aG "$group" "$username" 2>>$LOGFILE
        done
    fi

    # Set home directory permissions
    chmod 700 /home/$username
    chown $username:$username /home/$username

    # Log the creation of the user
    echo "Created user $username with groups $groups" | tee -a $LOGFILE
done < "$FILE"

echo "User creation process completed." | tee -a $LOGFILE
