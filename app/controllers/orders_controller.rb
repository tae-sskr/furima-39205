class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :sold
  before_action :items_user

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :address1, :address2, :building_name, :telephone).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def sold
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def items_user
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end


end
