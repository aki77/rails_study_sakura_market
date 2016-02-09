class LineItemsController < ApplicationController
  before_action :set_cart, only: %i(create)
  before_action :set_product, only: %i(create)

  def create
    @line_item = @cart.add_product(@product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @product, notice: 'カートに追加しました。' }
      else
        format.html { redirect_to @product, alert: 'カートに追加できませんでした。' }
      end
    end
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
