class UserController < ApplicationController

  get '/new' do
    erb :'users/create'
  end

  post '/users' do
    if User.find_by(:username => params[:username])
      redirect '/new'
    end
    @user = User.create(params)
    session[:id] = @user.id
    redirect "users/#{@user.slug}"
  end

  get '/users/:slug' do

  end

end
