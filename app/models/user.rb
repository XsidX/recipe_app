class User < ApplicationRecord
  has_many :foods, dependent: :destroy, foreign_key: :food_id
  has_many :recipes, dependent: :destroy, foreign_key: :recipe_id

  validates :name, presence: true
end
