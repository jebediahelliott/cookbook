class RemoveIngredientAmountFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :ingredient_amount, :string
  end
end
