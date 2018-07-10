class UserController < ApplicationController

  get '/new' do
    erb :'users/create'
  end

  post '/users' do
    binding.pry
  end

end
