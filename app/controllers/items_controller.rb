class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    if current_user.id == @item.user_id
      set_item
    else
      redirect_to action: :index
    end
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to action: :index
    else
      redirect_to action: :index
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

  def set_item
    @item = Item.find(params[:id])
  end

end
