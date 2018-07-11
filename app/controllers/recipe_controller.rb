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
    redirect "recipes/#{@recipe.slug}"
  end

  get '/recipes/:slug' do
    @recipe = Recipe.find_by_slug(params[:slug])
    erb :'recipes/show'
  end

  delete '/recipes/:slug/delete' do
    @recipe = Recipe.find_by_slug(params[:slug])
    @user = User.find(@recipe.user_id)
    @recipe.destroy

    redirect "users/#{@user.slug_username}"
  end

end
