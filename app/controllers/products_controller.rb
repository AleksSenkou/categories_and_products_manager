class ProductsController < ApplicationController
  before_action :load_product, only: %w(show edit update destroy)

  def index
    @products = Product.includes(:category).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = 'Product had been created successfully'
      redirect_to @product
    else
      render :new
    end
  end

  def show
    @category = @product.category
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      flash[:success] = 'Product had been updated successfully'
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Product had been deleted"
    redirect_to products_url
  end

  private

  def load_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
