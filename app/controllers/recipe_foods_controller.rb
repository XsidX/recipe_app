class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    recipe_food_params[:food_id]&.each_with_index do |food_id, index|
      ingredient = RecipeFood.new(recipe_id: recipe_food_params[:recipe_id], food_id:,
                                  quantity: recipe_food_params[:quantity][index])
      if ingredient.save
        flash[:notice] = 'Ingredient added successfully'
      else
        flash[:alert] = 'Failed to add ingredient.'
      end
    end
    redirect_to recipe_path(recipe_food_params[:recipe_id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_food_update_params)
      flash[:notice] = 'Ingredient updated successfully'
    else
      flash[:alert] = 'Failed to update ingredient.'
    end
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, food_id: [], quantity: [])
  end

  def recipe_food_update_params
    params.require(:recipe_food).permit(:quantity)
  end
end
