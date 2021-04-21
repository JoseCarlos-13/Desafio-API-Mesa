FactoryBot.define do
  factory :place do
    sequence(:name) { |n| "MyString#{n}" }
  end
end
