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

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :status_id
    validates :delivery_charge_id
    validates :delivery_date_indication_id
  end

  with_options presence: true do
    validates :title
    validates :description
    validates :image
  end

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
