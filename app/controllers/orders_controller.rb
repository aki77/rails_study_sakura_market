class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart
  before_action :has_line_items?, only: %i(new create)
  before_action :has_destination?, only: %i(new create)

  def index
    @orders = current_user.orders.page(params[:page]).order(id: :desc).includes(line_items: :product)
  end

  def new
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.add_line_items_from_cart(@cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_url, notice: '注文を確定しました。'
    else
      render :new
    end
  end

  private

    def has_line_items?
      unless @cart.line_items.present?
        redirect_to products_url, alert: 'ショッピングカートが空です。'
      end
    end

    def has_destination?
      unless current_user.destination.present?
        redirect_to new_destination_url, alert: '送付先情報を登録してください。'
      end
    end

    def order_params
      params.require(:order).permit(:delivery_days, :delivery_time)
    end
end
