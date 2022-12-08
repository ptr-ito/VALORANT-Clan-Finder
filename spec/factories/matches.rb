FactoryBot.define do
  factory :match do
    user

    sequence(:title) { |n| "test-title-#{n}" }
    sequence(:body) { |n| "test-body-#{n}" }
    status { :published }
    rank { Rank.all.sample }
    mode { Mode.all.sample }

    trait :published do
      status { :published }
    end

    trait :closed do
      status { :closed }
    end
  end
end
