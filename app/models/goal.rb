class Goal < ActiveRecord::Base
  
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  
  has_many :participations, :uniq => true
  has_many :students, :through => :participations, :class_name => 'User',
    :conditions => "participations.role = 'student'",
    :uniq => true
  has_many :mentors, :through => :participations, :class_name => 'User',
    :conditions => "participations.role = 'mentor'",
    :uniq => true
    
  has_many :milestones
  
  validates :name, :presence => true
  validates :description, :presence => true
  validates :ends_at, :date => {:after => Time.now.to_date}, :if => 'ends_at.present?'
  
  scope :created_by, lambda{|user| where(:creator_id => user.id)}
  scope :participant, lambda{|user| where("participations.user_id = ?", user.id).joins('left join participations on participations.goal_id = goals.id')}
  scope :creator_or_participant, lambda{|user| where("(goals.creator_id = ? or participations.user_id = ?)", user.id, user.id).joins('left join participations on participations.goal_id = goals.id')}
  scope :public, where(:is_private => false)
  
  def ongoing?
    ends_at.blank?
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

