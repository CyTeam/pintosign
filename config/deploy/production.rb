set :rails_env, 'production'
set :branch, "master"

set :deploy_to, '/srv/pintosign.ch/pintosign'
role :web, "web01.wikisigns"                          # Your HTTP server, Apache/etc
role :app, "web01.wikisigns"                          # This may be the same as your `Web` server
role :db,  "web01.wikisigns", :primary => true        # This is where Rails migrations will run

