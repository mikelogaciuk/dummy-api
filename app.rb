# frozen_string_literal: true

require 'sinatra/base'

# This class represents a dummy API application using Sinatra.
class App < Sinatra::Base
  set :environment, :production

  get '/' do
    content_type :json
    status 200
    { message: 'Dummy API' }.to_json
  end

  get '/health' do
    content_type :json
    status 200
    { message: 'OK' }.to_json
  end

  get '/error' do
    content_type :json
    status 500
    { message: 'Internal Server Error' }.to_json
  end

  run if app_file == App
end
