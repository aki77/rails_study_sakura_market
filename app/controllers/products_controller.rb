class ProductsController < ApplicationController
  before_action :set_product, only: %i(show)

  def index
    @q = Product.search(params[:q])
    @q.sorts = 'order asc' if @q.sorts.empty?
    @products = @q.result.visible.page(params[:page])
  end

  def show
  end

  private

    def set_product
      @product = Product.visible.find(params[:id])
    end
end
