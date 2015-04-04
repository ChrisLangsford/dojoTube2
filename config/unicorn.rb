# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/my_app"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/www/my_app/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/www/my_app/log/unicorn.log"
stdout_path "/var/www/my_app/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.myapp.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30

export MANDRILL_USERNAME='dojotube101@gmail.com'
export MANDRILL_PASSWORD='Fk1PEm1DBLApNevyX4XZsQ' 
export AWS_ACCESS_KEY_ID='AKIAJFDXRAL22P26SYQQ'
export AWS_SECRET_ACCESS_KEY='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'
export S3_BUCKET='dojo-tube-in'