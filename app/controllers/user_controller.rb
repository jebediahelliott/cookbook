class UserController < ApplicationController

  get '/new' do
    erb :'users/create'
  end

end
