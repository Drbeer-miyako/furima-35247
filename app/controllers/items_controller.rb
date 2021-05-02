class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_date_indication_id, :price).merge(user_id: current_user.id)
  end
  

end
