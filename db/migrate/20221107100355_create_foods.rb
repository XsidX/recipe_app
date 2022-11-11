class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :user, null: false, foreign_key: { to_table: :users}
      t.string :name
      t.string :measurement_unit
      t.decimal :price, precision: 5, scale: 2, default: 0
      t.decimal :quantity, precision: 5, scale: 2, default: 0
      t.timestamps
    end
  end
end
