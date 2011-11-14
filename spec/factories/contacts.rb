# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name "MyString"
    address ""
    city "MyString"
    zip "MyString"
    email "MyString"
    comments "MyText"
  end
end
