class RecipeController < ApplicationController

  get '/recipes/new' do
    if logged_in?(session)
      erb :'recipes/create'
    end
  end

  post '/recipes' do
    recipe = Recipe.create(params[:recipe])
    params[:ingredients].each_with_index do |ingredient, i|
      ing = Ingredient.create(ingredient)
      amt = Amount.create(params[:amounts][i])
      ing.amounts << amt
      recipe.amounts << amt
    end
    erb :'recipes/show'
  end

end
