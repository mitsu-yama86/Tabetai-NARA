class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

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

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  def destroy
    @product = Product.find(params[:id])
    if current_user.id == @product.user_id
      @product.destroy
    end
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :brand, :origin_id, :text).merge(user_id: current_user.id)
  end

end
