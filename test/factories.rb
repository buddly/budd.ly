require 'factory_girl_rails'

Factory.define :goal do |goal|
  goal.name        'My Goal'
  goal.description 'Goal description'
  goal.association :creator
end

Factory.define :milestone do |milestone|
  milestone.association :goal
  milestone.name        'Some milestone'
  milestone.description 'Some description'
  milestone.ends_at     1.week.from_now
end

Factory.define :user do |user|
  user.first_name    'John'
  user.last_name     'Doe'
  user.email         {Factory.next(:email)}
  user.password       'secret'
  
  user.confirmed_at  1.hour.ago
end

Factory.define :creator, :parent => :user do |user|
  
end

Factory.sequence :email do |n|
  "johndoe-#{n}@example.com"
end