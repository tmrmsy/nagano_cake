class Admin::CustomersController < ApplicationController
  def index
     @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def create
    customer = Customer.find(params[:id])
    customer.update
    redirect_to admin_cutomer_path(customer.id)
  end
  
end
