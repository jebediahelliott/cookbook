class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.string :ingredient_amount
      t.integer :recipe_id
      t.integer :ingredient_id
    end
  end
end
