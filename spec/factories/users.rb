FactoryBot.define do
  factory :user do
    sequence(:sub) { |n| "test-sub-#{n}" }
  end
end
