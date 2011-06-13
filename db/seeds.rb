# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

u1 = User.create(
  :first_name => 'Jeff',
  :last_name  => 'Emminger',
  :email      => 'jemminger@gmail.com',
  :password   => 'ChangeMe!',
  :password_confirmation => 'ChangeMe!'
)
u1.is_superadmin = true
u1.confirmed_at  = Time.now.utc
u1.save

u2 = User.create(
  :first_name => 'Alex',
  :last_name  => 'Auchter',
  :email      => 'aauchter@gmail.com',
  :password   => 'ChangeMe!',
  :password_confirmation => 'ChangeMe!'
)
u2.is_superadmin = true
u2.confirmed_at  = Time.now.utc
u2.save
