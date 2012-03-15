Fabricator(:user) do
  email "test@example.com"
  password 'password'
  #password_confiramtion {|user| user.password }
end