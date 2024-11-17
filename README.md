# file-directory-backup

Linux Shell Scripting Project	

Write a shell scripting program that will back up a directory of files. It should perform the backup by copying each file from the given directory to a backup directory.
The program should take two command line arguments, one being the path of the directory to copy, the second being the name of the path in which to place the backup.
If the backup is performed repeatedly, the program should recopy only those files that have been modified since the last time they were backed up.
The program should ignore subdirectories; it needs to backup files only within the given directory.
