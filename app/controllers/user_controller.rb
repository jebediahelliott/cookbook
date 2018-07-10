class UserController < ApplicationController

  get '/new' do
    erb :'users/create'
  end

  post '/users/new' do
    if User.find_by(:username => params[:username])
      redirect '/new'
    end
    @user = User.create(params)
    session[:id] = @user.id
    redirect "users/#{@user.slug}"
  end

  get '/login' do
    erb :'users/login'
  end

  post '/users/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      redirect 'users/login'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if logged_in?(session) && (@user == current_user(session))
      erb :'users/show'
    elsif !logged_in?(session)
      redirect "users/#{@user.slug}"
    else
      redirect '/new'
    end
  end

end
