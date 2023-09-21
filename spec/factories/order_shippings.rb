FactoryBot.define do
  factory :order_shipping do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { '123-4567' }
    prefecture_id { 3 }
    address1 { '練馬区' }
    address2 { '富士見台1-2' }
    building_name { '富士見台アパート' }
    telephone { '09012345678' }
  end
end
