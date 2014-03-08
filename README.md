mail_backup
===========

A simple ruby script to send mysql backup (compressed) to an email address

## ATTENTION ##
This script is used to backup a development server, it was not intended to be used in a production environment

## Requirements ##
- mysqldump (to dump database)
- tar (used for compression)
- mutt (to send email)

## Information ##
- Compression format is tag.gz
- Backup filename uses this format: [mysql_db_name]_[date_time_with_format_%Y%m%d%H%M].tar.gz
- This script sends email to 1 only recipient
- This script backups only 1 database (if you want to dump many database you can fork it and change the dump command)
- It works (by design) only with a mysql server
- This script relies on the presence of tmp directory on the same place of config.yml (again, if you have specific needs you can fork it and change it as you like)
- The body of email is fixed in mail_txt.txt, if you want you can edit it
- On every backup the last done is deleted