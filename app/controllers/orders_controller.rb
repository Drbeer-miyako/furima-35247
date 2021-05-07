class OrdersController < ApplicationController
     before_action :authenticate_user!
     before_action :find_id
     before_action :sold_out_item, only: [:index]

     def index
          @order_address = OrderAddress.new
     end

     def create
          @order_address = OrderAddress.new(order_params)
          if @order_address.valid? 
             pay_item
             @order_address.save
             redirect_to root_path
          else
            render action: :index
          end
     end

     private
     def order_params
       params.require(:order_address).permit(:prefecture_id, :city, :address, :block, :building, :telephone).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
     end

     def pay_item
          Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
          Payjp::Charge.create(
            amount: @item[:price], 
            card: order_params[:token],  
            currency: 'jpy'             
          )
     end
     
     def find_id
          @item = Item.find(params[:item_id])
     end

     def sold_out_item
          # redirect_to root_path if @item.order.present?
          # redirect_to root_path if current_user.id == @item.user_id
          if @item.order.present? || current_user.id == @item.user_id
               redirect_to root_path
          end
     end

end
