class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
 
  def index
    @recipes = Recipe.all
  end

 
  def show
  end

  
  def new
    @recipe = current_user.recipes.build
  end

 
  def edit
  end

 
  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
     redirect_to @recipe, notice: 'Recipe was successfully created.'
      else
     render :new 
      
    end
  end

 
  def update
    if @recipe.update(recipe_params)
       redirect_to @recipe, notice: 'Recipe was successfully updated.' 
     else
       render :edit 
    end
  end


  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private
   
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end


    def correct_user
      @recipe = current_user.recipes.find_by(id: params[:id])
      redirect_to recipes_path, notice: "Not Authorized to edit this pin." if @recipe.nil?
    end

    def recipe_params
      params.require(:recipe).permit(:image, :title, :date, :ingredients, :directions, :cooktime, :servings)
    end
end
