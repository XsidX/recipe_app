class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: %i[show destroy update]
  def index
    @recipes = Recipe.all.select { |recipe| recipe.user == current_user }
  end

  def show
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
    @foods = Food.where(user: current_user)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = 'Recipe failed to create'
      render :new
    end
  end

  def destroy
    if @recipe.destroy
      flash[:notice] = 'Recipe deleted successfully'
    else
      flash[:alert] = 'Recipe failed to delete'
    end
    redirect_to recipes_path
  end

  def update
    if @recipe.update(recipe_update_status_params)
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

  def recipe_update_status_params
    params.require(:recipe).permit(:public)
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
