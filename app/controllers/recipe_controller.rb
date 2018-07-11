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
    if logged_in?(session) && (@recipe.user == current_user(session))
      erb :'recipes/show'
    elsif logged_in?(session)
      @user = User.find(session[:id])
      redirect "users/#{@user.slug_username}"
    else
      redirect '/'
    end

  end

  get '/recipes/:slug/edit' do
    @recipe = Recipe.find_by_slug(params[:slug])
    if logged_in?(session) && (@recipe.user == current_user(session))
      erb :'recipes/edit'
    elsif logged_in?(session)
      @user = User.find(session[:id])
      redirect "users/#{@user.slug_username}"
    else
      redirect '/'
    end

  end

  patch '/recipes/:slug' do
    recipe = Recipe.find_by(:name => params[:recipe][:name])
    recipe.update(params[:recipe])
    recipe.ingredients.each_with_index do |ingredient, i|
      ingredient.update(params[:ingredients][i])
      ingredient.amounts[0].update(params[:amounts][i])
    end
    redirect "recipes/#{recipe.slug}"
  end

  delete '/recipes/:slug/delete' do
    @recipe = Recipe.find_by_slug(params[:slug])
    @user = User.find(@recipe.user_id)
    @recipe.amounts.each do |amount|
      amount.destroy
    end
    @recipe.destroy

    redirect "users/#{@user.slug_username}"
  end

end
