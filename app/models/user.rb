class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods, dependent: :destroy, foreign_key: :food_id
  has_many :recipes, dependent: :destroy, foreign_key: :recipe_id

  validates :name, presence: true
end
