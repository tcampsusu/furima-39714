class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit]
  before_action :set_item, only: [:edit,:show ,:update ]
  before_action :move_to_index, only: [:edit]
  

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


  def show
  end

  def update
   if @item.update(item_params)
    redirect_to item_path
  else
    render :edit, status: :unprocessable_entity
  end
end


  def edit
  end

  
  private

  def item_params
    params.require(:item).permit(:image,:item_name,:item_description,:item_category_id,:item_condition_id,:item_shipping_fee_status_id,:item_shipping_area_id,:item_shipping_time_id, :item_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless @item.user == current_user
      redirect_to action: :index
    end


end

end
