class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :encryptable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable,
        :validatable,
        :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name, :address_line_1, :address_line_2, :city,
    :state, :postal_code, :organization_name
  
  has_many :participations, :uniq => true
  has_many :goals, :foreign_key => :creator_id
  has_many :student_goals, :through => :participations, :class_name => 'Goal',
    :conditions => "participations.role = 'student'",
    :uniq => true
  has_many :mentor_goals, :through => :participations, :class_name => 'Goal',
    :conditions => "participations.role = 'mentor'",
    :uniq => true
  
  # email and password validation already handled by Devise
  
  validates :first_name,
    :presence => true

  validates :last_name,
    :presence => true
    
  def created_goals
    Goal.created_by(self)
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
#  superadmin             :boolean         default(FALSE)
#

