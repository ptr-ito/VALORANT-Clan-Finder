FactoryBot.define do
  factory :user do
    sequence(:name, "username_1")
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
