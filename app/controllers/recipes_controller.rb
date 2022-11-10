class RecipesController < ApplicationController

  before_action :set_recipe, only: %i[show destroy update]
  def index
    @recipes = Recipe.all.select { |recipe| recipe.user == current_user }
  end

  def show
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
    @foods = Food.where(user: current_user)
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = 'Recipe updated successfully'
    else
      flash[:alert] = 'Recipe failed to update'
    end
    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:public)
  end

end
