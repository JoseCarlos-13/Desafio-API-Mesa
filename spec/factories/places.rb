FactoryBot.define do
  factory :place do
    sequence(:name) { |n| "MyString#{n}" }
    sequence(:user) { |n| n }
    lat { nil }
    lng { nil }
  end
end
