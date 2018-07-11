class ApplicationController < Sinatra::Base

  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "password_security"
  register Sinatra::Flash


  get '/' do
    if logged_in?(session)
      @user = User.find(session[:id])
      redirect "users/#{@user.slug_username}"
    end
    redirect '/new'
  end

  def current_user(session)
    User.find(session[:id])
  end

  def logged_in?(session)
    !!session[:id]
  end

end
