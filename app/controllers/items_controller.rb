class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end



  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :shipping_id, :prefecture_id, :schedule_id, :price, :user, :image).merge(user_id: current_user.id)
  end

end
