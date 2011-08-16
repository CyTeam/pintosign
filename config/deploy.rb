require 'cookbook/wikisigns'

#Application
set :application, "pintosign"
set :repository,  "git@github.com:CyTeam/pintosign.git"

# Staging
set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

# Deployment
set :server, :passenger
set :user, "deployer"                               # The server's user for deploys

# Sync directories
set :sync_directories, ["public/uploads"]
set :sync_backups, 3

# Configuration
set :scm, :git
ssh_options[:forward_agent] = true
set :use_sudo, false
set :deploy_via, :remote_cache
set :git_enable_submodules, 1
set :copy_exclude, [".git", "spec"]
