class UserController < ApplicationController

  get '/new' do
    erb :'users/create'
  end

  post '/users/new' do
    if User.find_by(:username => params[:username])
      flash[:message] = "Please select a different username."
      redirect '/new'
    end
    @user = User.create(params)
    session[:id] = @user.id
    redirect "users/#{@user.slug_username}"
  end

  get '/login' do
    erb :'users/login'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  post '/users/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/users/#{@user.slug_username}"
    else
      redirect 'users/login'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug_username(params[:slug])
    if logged_in?(session) && (@user == current_user(session))
      erb :'users/show'
    elsif !logged_in?(session)
      redirect "users/#{@user.slug_username}"
    else
      redirect '/new'
    end
  end

end
