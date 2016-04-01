FactoryGirl.define do
  factory :author do
    name "Jack Kerouac"
    sequence(:email) { |n| "jack.#{n}@adaptoid.io" }
    sequence(:username) { |n| "jack#{n}" }

    trait :invalid do
      name ""
    end
  end
end
