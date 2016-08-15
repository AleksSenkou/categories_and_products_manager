class CategoriesController < ApplicationController
  before_action :load_category, only: %w(show edit update destroy)

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = 'Category had been created successfully'
      redirect_to @category
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = 'Category had been updated successfully'
      redirect_to @category
    else
      render :edit
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category.destroy
    flash[:success] = "Category had been deleted"
    redirect_to categories_url
  end

  private

  def load_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
