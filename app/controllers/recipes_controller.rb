class RecipesController < ApplicationController
    before_action :get_recipes, only: [:index]
    before_action :set_recipe, only: [:show, :edit, :update]
    before_action :get_recipe, only: [:new]

    def index
    end

    def show
    end

    def new
        # @recipe.ingredients.build
    end

    def create
        # raise params.inspect
        @recipe = Recipe.new
        @recipe.name = params[:recipe][:name]
        @recipe.description = params[:recipe][:description]

        if @recipe.save
            redirect_to recipes_path
        else
            render :new
        end

    end

    def edit
    end

    def update
        @recipe.update(recipe_params)
        if @recipe.save
            redirect_to recipes_path
        else
            render :edit
        end
    end

    def destroy
    end

    private 

    def get_recipes
        @recipes = Recipe.all
    end

    def get_recipe
        @recipe =  Recipe.new
    end

    def set_recipe
        @recipe = Recipe.find_by(id: params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, :description, ingredients: [])
    end

end
