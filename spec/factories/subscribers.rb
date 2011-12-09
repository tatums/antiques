# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscriber do
    first "MyString"
    last "MyString"
    email "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
  end
end
