class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end
  
  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(items_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  

  private

  def items_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id,
      :charge_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
