# require 'sinatra/base'
# require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "password_security"
  # register Sinatra::Flash

  get '/' do
    redirect '/new'
  end

  def current_user(session)
    User.find(session[:id])
  end

  def logged_in?(session)
    !!session[:id]
  end

end
