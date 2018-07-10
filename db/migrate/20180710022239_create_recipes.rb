class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :method
      t.string :notes
      t.integer :user_id
    end
  end
end
