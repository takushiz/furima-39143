class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
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

end
