class CreateRemoveRecipeIdFromIngredients < ActiveRecord::Migration
  def change
    remove_column :ingredients, :recipe_id, :integer
  end
end
