# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    body "MyText"
    notable_id 1
    notable_type "MyString"
  end
end
