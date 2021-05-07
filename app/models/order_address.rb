class OrderAddress < ApplicationRecord
     include ActiveModel::Model
     attr_accessor :address, :prefecture_id, :city, :block, :building, :telephone, :user_id, :item_id, :token, :price

     with_options presence: true do
          validates :token
          validates :user_id
          validates :item_id
          validates :address, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
          validates :city
          validates :block
          validates :telephone, length: { maximum: 11 }, numericality: {only_integer: true}
     end

     validates :prefecture_id, numericality: { other_than: 0 }
     def save
          order = Order.create(item_id: item_id, user_id: user_id)
          DeliveryAddress.create(address: address, prefecture_id: prefecture_id, city: city, block: block, building: building, telephone: telephone, order_id: order.id)
     end
end
