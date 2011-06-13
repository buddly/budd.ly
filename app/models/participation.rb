class Participation < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user
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

