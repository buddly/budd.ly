require 'test_helper'

class MilestoneTest < ActiveSupport::TestCase
  
  test 'should have initial stage' do
    milestone = Factory(:milestone)
    assert_equal 'Not Started', milestone.stage
  end
  
end

# == Schema Information
#
# Table name: milestones
#
#  id          :integer         not null, primary key
#  goal_id     :integer
#  name        :string(255)
#  description :string(255)
#  stage       :string(255)
#  ends_at     :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

