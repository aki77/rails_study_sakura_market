class Admin::ProductsController < Admin::AdminController
  before_action :set_product, only: %i(show edit update destroy)

  def index
    @products = Product.page(params[:page]).order(:order)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, @product], notice: '商品を登録しました。'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to [:admin, @product], notice: '商品を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_url, notice: '商品を削除しました。'
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :product_image, :price, :description, :hidden, :order, :remove_product_image)
    end
end
