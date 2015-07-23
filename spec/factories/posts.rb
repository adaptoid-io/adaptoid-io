FactoryGirl.define do
  factory :post do
    title 'On The Road'
    publication_date { Date.new(1957, 9, 5) }
    body '# On The Road'
    slug 'on-the-road'

    trait :invalid do
      slug ''
    end
  end
end
