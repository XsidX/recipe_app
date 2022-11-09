class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods, dependent: :destroy, foreign_key: :recipe_id

  validates :name, presence: true
end
