FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8, mix_case: true, special_characters: false) + "1a" }
    password_confirmation { password }
    nickname { Faker::Internet.username }
    last_name { "山田" } # バリデーションに合致する全角文字
    first_name { "太郎" } # バリデーションに合致する全角文字
    kana_last_name { "ヤマダ" } # 全角カタカナ
    kana_first_name { "タロウ" } # 全角カタカナ
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
