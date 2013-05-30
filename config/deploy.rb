require 'bundler/capistrano'
set :application, "muser"
set :scm, :git
set :repository,  "git@github.com:calo81/muser.git"
server "localhost", :web, :app, :db, :primary => true
ssh_options[:port] = 2222
ssh_options[:keys] = "~/.vagrant.d/insecure_private_key"
set :user, "vagrant"
set :group, "vagrant"
set :deploy_to, "/tmp"
set :use_sudo, false
set :deploy_via, :copy
set :copy_strategy, :export

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "Passenger"                          # Your HTTP server, Apache/etc
role :app, "Passenger"                          # This may be the same as your `Web` server
role :db,  "MongoDB", :primary => true # This is where Rails migrations will run
role :db,  "MongoDB"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end