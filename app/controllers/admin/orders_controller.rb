class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order.postage = 800
    @order_details = OrderDetail.all
    @total = 0
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order.id)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
  
end
