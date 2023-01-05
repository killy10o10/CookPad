class RecipesController < ApplicationController
    before_action :authenticate_user!

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user = current_user
        if @recipe.save
            redirect_to recipes_path
        else
            render 'new'
        end
    end

    def public
        @recipes = Recipe.where(public: true)
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path
    end

    def recipe_params
        params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
    end
end
