class LineItemsController < ApplicationController
  before_action :set_product
  before_action :set_line_item, only: %i(update)

  def create
    # FIXME: quantityパラメータが無い場合に500エラーになりそう
    @line_item = @cart.add_product(@product, line_item_params[:quantity])

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to cart_url, notice: 'カートに追加しました。' }
      else
        format.html { redirect_to @product, alert: 'カートに追加できませんでした。' }
      end
    end
  end

  def destroy
    @cart.remove_product(@product)
    redirect_to cart_path
  end

  def update
    # FIXME: この書き方はあまり良くない気がする
    raise AbstractController::ActionNotFound unless request.xhr?

    if @line_item.update(line_item_params)
      head :no_content
    else
      head :bad_request
    end
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_line_item
      @line_item = @cart.line_items.find_by!(product: @product)
    end

    def line_item_params
      params.require(:line_item).permit(:quantity)
    end
end
