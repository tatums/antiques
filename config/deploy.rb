ssh_options[:forward_agent] = true
require 'json'
set :user_details, JSON.parse(IO.read('dna.json'))
set :domain, "192.168.1.5"
set :application, domain
set :user, user_details['tatum']
set :password, user_details['pa88word']
set :deploy_to, "/home/#{user}"
set :use_sudo, false
set :repository, "git@github.com:bangline/capdemo.git"
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
role :app, domain
role :web, domain
role :db, domain, :primary => true
# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
# task :start do ; end
# task :stop do ; end
# task :restart, :roles => :app, :except => { :no_release => true } do
# run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
# end
# end










set :application, "Phoebe Booth Aniques"
set :repository,  "set your repository location here"

set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "192.168.1.5"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.5"                          # This may be the same as your `Web` server
role :db,  "192.168.1.5", :primary => true # This is where Rails migrations will run
role :db,  "192.168.1.5"

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