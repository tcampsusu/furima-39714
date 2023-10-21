FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {"s1" +  Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation {password}
    last_name             { japanese_user.last.kanji }
    first_name            { japanese_user.first.kanji }
    last_name_kana        { japanese_user.last.katakana }
    first_name_kana       { japanese_user.first.katakana } 
    birth_date            { Faker::Date.birthday}
  end
end