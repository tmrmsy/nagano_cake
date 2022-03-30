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

    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_name = @address.name

    elsif params[:order][:select_address] == "2"

    else
      render :new
    end
  end

  def create
   @order = Order.new(order_params)
   @order.save
   current_customer.cart_items.each do |cart_item|
    order_detail = OrderDetail.new
    order_detail.order_id = @order.id
    order_detail.item_id = cart_item.item_id
    order_detail.amount = cart_item.amount
    order_detail.price = cart_item.item.with_tax_price * cart_item.amount
    order_detail.save
  end
  current_customer.cart_items.destroy_all
   redirect_to complete_path
  end

  def complete
  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:shipping_postal_code, :shipping_address, :shipping_name, :payment_method, :postage, :amount_billed, :customer_id)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount)
  end

end
