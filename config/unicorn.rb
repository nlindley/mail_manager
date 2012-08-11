root = "/var/www/manage.thisoneplace.com/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stdout_path "#{root}/log/unicorn.log"
stderr_path "#{root}/log/unicorn_errors.log"

listen "#{root}/tmp/unicorn.sock"
worker_processes 2
timeout 30
