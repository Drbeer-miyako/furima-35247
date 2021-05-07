FactoryBot.define do
  factory :order_address do
      token {"tok_abcdefghijk00000000000000000"}
      

      address               { "123-4567" }
      prefecture_id         {1}
      city                  { "町のなまえ" }
      block                 { "3丁目" }
      telephone             { "1234567890" }
      building              { '東京ハイツ' }
  end
end
