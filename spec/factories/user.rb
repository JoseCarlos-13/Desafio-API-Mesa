FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "MyString#{n}" }
    sequence(:email) {|n| "mystring#{n}@gmail.com" }
    sequence(:password) { |n| "myString#{n}" }
  end
end