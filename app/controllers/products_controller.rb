class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def data
    render plain: serializeProduct(params[:id])
  end

  private

  def serializeProduct(id)
    p = Product.find_by_id(id)
    serial = '{' +
      [
        %Q("id": #{p.id}),
        %Q("name": "#{p.name}"),
        %Q("price": #{p.price}),
        %Q("description": "#{p.description}"),
        %Q("inventory": #{p.inventory || 0})
      ].join(', ') + '}'
  end

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
