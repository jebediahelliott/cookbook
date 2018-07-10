class AddIngredientAmountToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredient_amount, :string
  end
end
