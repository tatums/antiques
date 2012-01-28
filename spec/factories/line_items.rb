# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :line_item do
    position 1
    porduct_id 1
    item_number "MyString"
    description "MyString"
    dimensions "MyString"
    quantity 1
    price "9.99"
    tax "9.99"
    total "9.99"
  end
end
