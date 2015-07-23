FactoryGirl.define do
  factory :post do
    title 'On The Road'
    publication_date { Date.new(1957, 9, 5) }
    body 'Body text'

    trait :invalid do
      title ''
    end
  end
end