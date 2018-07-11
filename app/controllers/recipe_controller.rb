class RecipeController < ApplicationController

  get '/recipes/new' do
    if logged_in?(session)
      erb :'recipes/create'
    end
  end

  post '/recipes' do
    @recipe = Recipe.create(params[:recipe])
    @user = User.find(session[:id])
    params[:ingredients].each_with_index do |ingredient, i|
      ing = Ingredient.create(ingredient)
      amt = Amount.create(params[:amounts][i])
      ing.amounts << amt
      @recipe.amounts << amt
    end
    @user.recipes << @recipe
    erb :"recipes/#{@recipe.slug}"
  end

end
