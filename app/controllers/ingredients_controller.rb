class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:edit, :show, :update]
    before_action :get_ingredients, only: [:index]
    before_action :get_ingredient, only: [:new]
    
    def index
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
        # raise params.inspect
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            redirect_to ingredients_path
        else
            render :new
        end
    end

    def update
        @ingredient.update(ingredient_params)
        if @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end
    end

    def destroy
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

    def set_ingredient
        @ingredient = Ingredient.find_by(id: params[:id])
    end

    def get_ingredient
        @ingredient = Ingredient.new
    end

    def get_ingredients
        @ingredients = Ingredient.all
    end

    
end
