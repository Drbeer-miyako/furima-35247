class ItemsController < ApplicationController
  def index
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  private
  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_date_indication_id, :price).merge(user_id: current_user.id)
  end

end
