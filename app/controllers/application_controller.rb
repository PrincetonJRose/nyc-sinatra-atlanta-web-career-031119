class ApplicationController < Sinatra::Base
  set :views, 'app/views/application'
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :index
  end

end
