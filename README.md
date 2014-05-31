mail_backup
============
A simple ruby script to send mysql backup (compressed) to an email address

## ATTENTION ##
This script is used to backup a development server, it was not intended to be used in a production environment

## Requirements ##
- mysqldump (to dump database)
- tar (used for compression)
- mutt (to send email)

## Information ##
- Compression format is tag.gz
- Backup filename example: foodb_201403080125.tar.gz
- This script sends email to 1 only recipient
- This script backups only 1 database (if you want to dump many database you can fork it and change the dump command)
- This script uses /tmp directory as temporary location (and it cleans its dust when finished)
- It works (by design) only with a mysql server
- The body of email is fixed in mail_txt.txt, if you want you can edit it