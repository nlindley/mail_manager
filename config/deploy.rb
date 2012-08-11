require "bundler/capistrano"

server "staging.lindleyinc.com", :web, :app, :db, primary: true

set :application, "mail_manager"
set :repository,  "nlindley@organ.thisoneplace.com:git/mail_manager.git"

set :scm, :git
set :deploy_to, "/var/www/manage.thisoneplace.com"
set :deploy_via, :remote_cache
set :use_sudo, false
set :user, "manage_thisoneplace_web"
set :branch, "master"
set :shared_children, shared_children + %w{public/uploads}

ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"

namespace :deploy do
  task :restart, roles: :app, except: { no_release: true } do
    run "kill -s HUP $(cat #{shared_dir}/pids/unicorn.pid)"
  end
end
namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end
namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end
