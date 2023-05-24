class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
  end

  # GET /recipes/new
  def new
    redirect_to recipes_path, flash: { alert: 'Please sign up or login!' } unless current_user
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @new_recipe = current_user.recipes.new(recipe_params)
    if @new_recipe.save!
      redirect_to recipes_path, flash: { alert: 'Your recipe is saved' }
    else
      redirect_to new_recipe_path, flash: { alert: 'Could not save your recipe' }
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    if current_user

      @recipe = Recipe.find(params[:id])
      if @recipe.public
        @recipe.update(public: false)
        flash[:notice] = 'You have updated the recipe status to private'
      else
        @recipe.update(public: true)
        flash[:notice] = 'You have updated the recipe status to public'
      end
      redirect_to recipe_path
    else
      redirect_to recipe_path(params[:id]), flash: { alert: 'Please sign up or login!' }
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    flash[:notice] = 'You have deleted the food!'
    redirect_to recipes_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
