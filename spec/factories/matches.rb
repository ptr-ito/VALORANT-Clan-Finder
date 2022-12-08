FactoryBot.define do
  factory :match do
    user

    sequence(:title, 'match-title-1')
    sequence(:body, 'match-body-1')
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
