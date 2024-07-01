# HNG11_Stage-1
# User Creation Script

## Overview

This project provides a bash script (`create_users.sh`) designed to automate the process of creating user accounts and groups on a Linux system. The script reads from an input file (`users.txt`) containing usernames and their associated groups, creates the users and groups, sets up home directories, generates random passwords, and logs all actions.

## Requirements

- The script must be run with root privileges.
- An input file (`users.txt`) formatted with usernames and groups.

## Input File Format

The input file should list usernames and groups in the format: `username;group1,group2`.

### Example

```
adam;sudo,dev,www-data
samuel;sudo
monday;dev,www-data
```

## Script Features

- Creates user accounts and groups.
- Assigns users to specified groups.
- Sets up home directories with appropriate permissions.
- Generates random passwords for users.
- Logs all actions to `/var/log/user_management.log`.
- Stores generated passwords securely in `/var/secure/user_passwords.csv`.

## Usage

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Prepare the input file**:
   Ensure your `users.txt` file is in the same directory as the script.

3. **Run the script**:
   ```bash
   sudo ./create_users.sh users.txt
   ```

## Logs and Password Storage

- **Logs**:
  All actions performed by the script are logged to `/var/log/user_management.log`.
  
- **Password Storage**:
  Generated passwords are stored securely in `/var/secure/user_passwords.csv`, and only the file owner has read/write access.

## Technical Article

For a detailed explanation of the script and how it works, read the [technical article](https://aicodeen.hashnode.dev/step-by-step-guide-to-automating-user-creation-with-bash).

## Additional Resources

Learn more about the HNG Internship and explore opportunities:
- [HNG Internship](https://hng.tech/internship)
- [HNG Hire](https://hng.tech/hire)

---
