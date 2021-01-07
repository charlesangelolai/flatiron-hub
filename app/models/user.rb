class User < ActiveRecord::Base
  has_many :projects
  has_many :survey_data, through: :projects

  has_secure_password
end
