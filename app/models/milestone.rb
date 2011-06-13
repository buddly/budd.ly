class Milestone < ActiveRecord::Base
  
  belongs_to :goal
  
  validates :name, :presence => true
  validates :ends_at, :presence => true, :date => {:after => Time.now.to_date}
  
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

