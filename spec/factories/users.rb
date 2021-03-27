FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {'太郎'}
    first_name {'田中'}
    last_name_kana {'タロウ'}
    first_name_kana {'タナカ'}
    birthday{Faker::Date.between(from: '2019-09-23', to: '2019-09-25')}
  end
end
