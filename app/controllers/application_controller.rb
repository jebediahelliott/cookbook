class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    redirect '/new'
  end

  def current_user(session)
    User.find_by_id(session[:id])
  end

  def logged_in?(session)
    !!session[:id]
  end

end
