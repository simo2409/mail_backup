require 'rubygems'
require 'yaml'

config_file = File.join(File.expand_path(File.dirname(__FILE__)), 'config.yml')

# Checking config file presence
raise 'Unable to find config.yml' unless File.exist?(config_file)

# Loading config file
config = YAML::load(File.open(config_file))

# Cleaning tmp
puts `rm -rf ./tmp/*`
# Dump db to file
puts `mysqldump -u #{config['mysql_user']} -p#{config['mysql_password']} -d #{config['mysql_db_name']} > ./tmp/dump.sql`
# Compress dump
archive_path = File.join("./tmp/", config['mysql_db_name'] + '_' + Time.now.strftime("%Y%m%d%H%M") + '.tar.gz')
puts `tar -pczf #{archive_path} ./tmp/dump.sql`
# Cleaning tmp
puts `rm ./tmp/dump.sql`
# Send email
puts "Sending email"
puts `mutt -s "Backup for #{config['mysql_db_name']}" #{config['recipient_email']} -a #{archive_path} < mail_txt.txt`