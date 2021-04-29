class Item < ApplicationRecord

     belongs_to :user
     has_one :order
     has_one_attached :image

     extend ActiveHash::Associations::ActiveRecordExtensions
     belongs_to_active_hash :category
     belongs_to_active_hash :prefecture
     belongs_to_active_hash :status
     belongs_to_active_hash :delivery_charge
     belongs_to_active_hash :delivery_date_indication

     VALID_PRICEL_HALF =                 /\A[0-9]+\z/

     validates :category_id, numericality: { other_than: 0 } 
     validates :prefecture_id, numericality: { other_than: 0 }
     validates :status_id, numericality: { other_than: 0 }
     validates :delivery_charge_id, numericality: { other_than: 0 }
     validates :delivery_date_indication_id, numericality: { other_than: 0 }
     
     validates :title, presence: true
     validates :description, presence: true
     validates :price, presence: true
     validates :image, presence: true

     validates  :price,  presence: true, format: {with: VALID_PRICEL_HALF},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
          greater_than: 300, less_than: 10000000
end
