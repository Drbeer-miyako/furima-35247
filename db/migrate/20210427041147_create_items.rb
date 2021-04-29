class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :title                          , null: false
      t.text  :description                       , null: false
      t.integer  :category_id                    , null: false
      t.integer  :status_id                      , null: false
      t.integer  :delivery_charge_id             , null: false
      t.integer  :prefecture_id                  , null: false
      t.integer  :delivery_date_indication_id    , null: false
      t.integer  :price                          , null: false
      t.references :user, foreign_key: true      , null: false
      t.timestamps
    end
  end
end
