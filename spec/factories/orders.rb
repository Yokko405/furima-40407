FactoryBot.define do
  factory :order_form do


    token {"tok_abcdefghijk00000000000000000"}

    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '中央区旭市' }
    address_number { '村上1-1-1' }
    phone_number { '0801234567' }

  end
end
