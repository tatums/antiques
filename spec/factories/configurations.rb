# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :configuration do
    address1 "MyString"
    address2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    phone "MyString"
  end
end
