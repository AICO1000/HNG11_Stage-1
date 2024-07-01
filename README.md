# HNG11_Stage-1
Linux User Creation Bash Script
Task
Your company has employed many new developers. As a SysOps engineer, write a bash script called create_users.sh that reads a text file containing the employee’s usernames and group names, where each line is formatted as user;groups.
The script should create users and groups as specified, set up home directories with appropriate permissions and ownership, generate random passwords for the users, and log all actions to /var/log/user_management.log. Additionally, store the generated passwords securely in /var/secure/user_passwords.txt.
Ensure error handling for scenarios like existing users and provide clear documentation and comments within the script.
Also write a technical article explaining your script, linking back to HNG
Requirements:
Each User must have a personal group with the same group name as the username, this group name will not be written in the text file.
A user can have multiple groups, each group delimited by comma ","
Usernames and user groups are separated by semicolon ";"- Ignore whitespace
e.g.
light; sudo,dev,www-data
idimma; sudo
mayowa; dev,www-data
For the first line, light is username and groups are sudo, dev, www-data
Technical Article: The article should be well-structured.
It MUST include at least two links to the HNG Internship websites; choose from any of https://hng.tech/internship, https://hng.tech/hire, or https://hng.tech/premium so others can learn more about the program.
The report should be concise.
The article should be public and accessible by anyone on the internet.
Acceptance Criteria:
Successful Run: The mentors will test your script by supplying the name of the text file containing usernames and groups as the first argument to your script (i.e bash create_user.sh <name-of-text-file> ) in an Ubuntu machine.
All users should be created and assigned to their groups appropriately
The file /var/log/user_management.log should be created and contain a log of all actions performed by your script.
The file /var/secure/user_passwords.csv should be created and contain a list of all users and their passwords delimited by comma, and only the file owner should be able to read it.
The technical article is clear, concise and captures the reasoning behind each step in your script.
Submission Mode:
Submit your task through the designated submission form Ensure you’ve:
Double-checked all requirements and acceptance criteria.
Provided a link to your GitHub repository containing your file in the submission form.
Thoroughly reviewed your work to ensure accuracy, functionality, and adherence to the specified guidelines before you submit it.
Provided a link to your technical article containing the reasoning behind your specific implementation.
PS:
Use a new repository for this task and your script should be in the root directory
Your repo should contain only 2 files - README.md, create_users.sh
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
