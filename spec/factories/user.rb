FactoryGirl.define do
  factory :user do
    email 'test_user@fake.email.com'
    password 'password'
    password_confirmation {|u| u.password }
  end
end
