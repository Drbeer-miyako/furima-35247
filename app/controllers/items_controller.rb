class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @item = Item.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(update_params)
        redirect_to item_path
    else
        render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_date_indication_id, :price).merge(user_id: current_user.id)
  end
  
  def update_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_date_indication_id, :price )
  end

  def set_item
    @item = Item.find(params[:id])
  end

end