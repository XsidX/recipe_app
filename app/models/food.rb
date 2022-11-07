class Food < ApplicationRecord
  has_many :recipes, through: :recipe_foods, dependent: :destroy, foreign_key: :food_id
  belongs_to :user

  validates :name, presence: true
end
