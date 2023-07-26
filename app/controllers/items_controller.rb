class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:order).order("created_at DESC")
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
  
  def show
    @item = Item.find(params[:id])
  end

  def edit
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      @item = Item.find(params[:id])
    else
      redirect_to action: :index
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(items_params)
      redirect_to item_path(params[:id])
    else
      @item = item
      render :edit
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
