class Milestone < ActiveRecord::Base
  
  STAGES = ["Not Started", "In Progress", "Completed", "Approved"]
  
  belongs_to :goal
  
  validates :name, :presence => true
  validates :ends_at, :presence => true, :date => true
  
  before_create :init_stage
  
  protected
  
  def init_stage
    self.stage = STAGES.first unless self.stage.present?
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

