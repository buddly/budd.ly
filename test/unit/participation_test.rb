require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: participations
#
#  id         :integer         not null, primary key
#  goal_id    :integer
#  user_id    :integer
#  role       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

