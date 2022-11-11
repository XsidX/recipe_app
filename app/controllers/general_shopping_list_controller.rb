class GeneralShoppingListController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = current_user.recipes
    @foods = current_user.foods

    @recipes.map do |recipe|
      recipe.recipe_foods.map do |recipe_food|
        food = @foods.select { |f| f.id == recipe_food.food_id }[0]
        food.quantity = food.quantity - recipe_food.quantity
      end
    end
    @foods = @foods.select { |f| f.quantity.negative? }
    @foods.each { |f| f.quantity *= -1 }
    @total = 0
    @foods.each do |food|
      @total += (food.price * food.quantity)
    end
  end
end
