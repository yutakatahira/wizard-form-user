FactoryBot.define do
  factory :user_detail do
    first_name { "直子" }
    last_name { "山田" }
    first_name_kana { "ナオコ" }
    last_name_kana { "ヤマダ" }
    phone_number { 9876543210 }
    postal_code { 9876540 }
    birth_year { 1989 }
    birth_month { 9 }
    birth_day { 20 }
    city { "かかか悪化かかかかかかかかかあかk" }
    address { "いいいいいいいいいいいいいいい" }
    building_name { "hhhhhhhhhhhhh" }
    user
  end
end
