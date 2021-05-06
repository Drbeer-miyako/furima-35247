class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string  :address                       , null: false
      t.string  :city                          , null: false
      t.string  :block                         , null: false
      t.string  :building                      , null: false
      t.string  :telephone                     , null: false
      t.integer  :prefecture_id                , null: false
      t.references :order, foreign_key: true   , null: false
      t.timestamps
    end
  end
end
