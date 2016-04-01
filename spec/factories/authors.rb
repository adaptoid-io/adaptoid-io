FactoryGirl.define do
  factory :author do
    name "Jack Kerouac"

    trait :invalid do
      name ""
    end
  end
end
