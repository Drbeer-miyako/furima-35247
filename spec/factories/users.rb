# FactoryBot.define do
#      factory :user do
#        nickname {Faker::Name.last_name}
#        email {Faker::Internet.free_email}
#        password = Faker::Internet.password(min_length: 6)
#        password {password}
#        password_confirmation {password}

#        family_name           {"全角"}
#        first_name            {"全角"}
#        family_name_kana      {"ゼンカクカナ"}
#        first_name_kana       {"ゼンカクカナ"}
#        birth_date            {"2021-01-01"}
#      end
# end

FactoryBot.define do
     password = 'a1'+ Faker::Internet.password(min_length: 6, max_length: 100)
   
     factory :user do
       nickname              { Faker::Name.name }
       email                 { Faker::Internet.free_email }
       password              { password }
       password_confirmation { password }
       first_name            { "ぜんかく" }
       family_name           { "ぜんかく" }
       first_name_kana       { "ゼンカクカナ" }
       family_name_kana      { "ゼンカクカナ" }
       birth_date            { "2020-01-01" }
     end
end