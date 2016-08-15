class ProductsController < ApplicationController
  before_action :load_product, except: %w(index new create)

  def index
    @products = Product.includes(:category).all
  end

  def new
    session[:product_params] = {}
    new_product_with_session_data
  end

  def create
    session[:product_params].deep_merge!(params[:product]) if params[:product]

    new_product_with_session_data

    if @product.valid?
      make_step
      session[:product_step] = @product.current_step
    end

    render_step
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
    params.require(:product).permit(:name, :price, :category_id).tap do |whlist|
      whlist[:properties] = params[:product][:properties]
    end
  end

  def new_product_with_session_data
    @product = Product.new(session[:product_params])
    @product.current_step = session[:product_step]
  end

  def make_step
    if params[:prev_button]
      @product.previous_step
    elsif @product.last_step?
      @product.save
    else
      @product.next_step
    end
  end

  def render_step
    if @product.new_record?
      render :new
    else
      session[:product_step] = session[:product_params] = nil
      flash[:success] = 'Product had been created successfully'
      redirect_to @product
    end
  end
end
