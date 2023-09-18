class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :items_user

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :address1, :address2, :building_name, :telephone).merge(user_id: current_user_id, item_id: @item.id, token: params[:token])
  end

end
