# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    title "MyString"
    subtotal "9.99"
    grand_total "9.99"
    tax "9.99"
    subscriber_id 1
  end
end
