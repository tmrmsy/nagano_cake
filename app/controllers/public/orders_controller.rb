class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @current_address = "〒" + current_customer.postal_code + " " + current_customer.address + " " + current_customer.last_name + current_customer.first_name
  end

  def confirm
    @order = Order.new(order_params)
    @order.postage = 800
    @total = 0
      if params[:order][:select_address] == "0"
        @order.shipping_postal_code = current_customer.postal_code
        @order.shipping_address = current_customer.address
        @order.shipping_name = current_customer.last_name + current_customer.first_name
        #@order.save

      elsif params[:order][:select_address] == "1"
        @address = Address.find(params[:order][:address_id])
        @order.shipping_postal_code = @address.postal_code
        @order.shipping_address = @address.address
        @order.shipping_name = @address.name
        #@order.save

      elsif params[:order][:select_address] == "2"
      else
        render :new
      end
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to complete_path
  end

  def complete
  end

  def show
  end

  def index
  end

  private

  def order_params
    params.require(:order).permit(:shipping_postal_code, :shipping_address, :shipping_name, :payment_method)
  end
end
