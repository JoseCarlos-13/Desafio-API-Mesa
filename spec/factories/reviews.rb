FactoryBot.define do
  factory :review do
    rating { "ok" }
    sequence(:comment) { |n| "MyString#{n}" }
    sequence(:user) { |n| n }
    sequence(:place) { |n| n }
  end
end
