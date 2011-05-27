require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test 'user should be valid' do
    user = Factory(:user)
    assert user.valid?
  end
  
  test 'user should not be superadmin' do
    user = Factory(:user)
    assert !user.is_superadmin?
  end

end


# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  password_salt          :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  address_line_1         :string(255)
#  address_line_2         :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  postal_code            :string(255)
#  organization_name      :string(255)
#

