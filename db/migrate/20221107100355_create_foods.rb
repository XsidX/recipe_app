class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :user, null: false, foreign_key: { to_table: :users}
      t.string :name
      t.string :measurement_unit
      t.integer :price, default: 0
      t.integer :quantity, default: 0
      t.timestamps
    end
  end
end
