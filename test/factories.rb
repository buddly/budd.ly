require 'factory_girl_rails'

Factory.define :user do |user|
  user.first_name    'John'
  user.last_name     'Doe'
  user.email         'johndoe@example.com'
  user.password       'secret'
  
  user.confirmed_at  1.hour.ago
end
