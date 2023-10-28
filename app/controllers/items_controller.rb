class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new 
    @item = Item.new
  end

  def create
    
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image,:item_name,:item_description,:item_category_id,:item_condition_id,:item_shipping_fee_status_id,:item_shipping_area_id,:item_shipping_time_id, :item_price).merge(user_id: current_user.id)
  end

end
