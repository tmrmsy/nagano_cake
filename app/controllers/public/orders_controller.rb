class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @current_address = "〒" + current_customer.postal_code + " " + current_customer.address + " " + current_customer.last_name + current_customer.first_name
    #@order.customer_id = current_customer.id
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer
    @order.save
    redirect_to orders_path
  end

  def index
  end

  def show
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :postage, :amount_billed, :payment_method)
  end
end
