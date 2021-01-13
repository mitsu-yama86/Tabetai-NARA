class ProductsController < ApplicationController

  def index
    @products = Product.order("created_at DESC").includes(:user)
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:image, :product_name, :brand, :origin_id, :text).merge(user_id: current_user.id)
  end
  
end
