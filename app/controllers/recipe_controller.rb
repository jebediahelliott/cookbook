class RecipeController < ApplicationController

  get 'recipes/new' do
    if logged_in?(session)
      erb :'recipes/create'
  end

end
