class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
end
