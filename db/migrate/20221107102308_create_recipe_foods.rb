class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.references :food, null: false, foreign_keys: { to_table: :foods}
      t.references :recipe, null: false, foreign_keys: { to_table: :recipes}
      t.integer :quantity, default: 0
      t.timestamps
    end
  end
end
