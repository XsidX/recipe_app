class Food < ApplicationRecord
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods, dependent: :destroy, foreign_key: :food_id
  belongs_to :user

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :quantity, :price, numericality: { greater_than: 0 }
end
