class User < ActiveRecord::Base
  has_many :projects
  belongs_to :cohort

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cohort_id, presence: true
  
  has_secure_password
end