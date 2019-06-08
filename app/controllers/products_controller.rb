class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def inventory
    render plain: prod.inventory > 0 ? true : false
  end

  def description
    render plain: prod.description
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def show
    @product = prod
  end

  def data
    render json: ProductSerializer.serialize(prod)
  end

  private

  def prod
    Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
