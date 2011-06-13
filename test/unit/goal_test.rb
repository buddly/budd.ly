require 'test_helper'

class GoalTest < ActiveSupport::TestCase

  
  test 'created_by should include only users own goals' do
    user1 = Factory(:user)
    user2 = Factory(:user)
    goal11 = Factory(:goal, :creator => user1)
    goal12 = Factory(:goal, :creator => user1)
    goal21 = Factory(:goal, :creator => user2)
    goal22 = Factory(:goal, :creator => user2)

    assert Goal.created_by(user1).include?(goal11)
    assert Goal.created_by(user1).include?(goal12)
    assert !Goal.created_by(user1).include?(goal21)
    assert !Goal.created_by(user1).include?(goal22)
    
    assert Goal.created_by(user2).include?(goal21)
    assert Goal.created_by(user2).include?(goal22)
    assert !Goal.created_by(user2).include?(goal11)
    assert !Goal.created_by(user2).include?(goal12)
  end
  

end



# == Schema Information
#
# Table name: goals
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  is_private  :boolean
#  creator_id  :integer
#  ends_at     :date
#  created_at  :datetime
#  updated_at  :datetime
#

