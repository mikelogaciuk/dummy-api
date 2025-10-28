# frozen_string_literal: true

require 'rake'

namespace :docker do
  desc 'Build the image'
  task :build do
    system('docker build -t mikelogaciuk/dummy-api:latest .')
  end

  desc 'Run the container'
  task :run do
    system('docker run -d -p 4567:4567 --name dummy-api-container mikelogaciuk/dummy-api:latest')
  end

  desc 'Run in interactive mode'
  task :interactive do
    system('docker run -it -p 4567:4567 --rm mikelogaciuk/dummy-api:latest /bin/bash')
  end

  desc 'Stop and remove the container'
  task :stop do
    system('docker rm -f dummy-api-container')
  end
end

desc 'Run the dummy API server using Puma'
task :run do
  system('bundle exec puma config.ru -C puma.rb -e production -p 4567')
end
