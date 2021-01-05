class Survey < ActiveRecord::Base
  belongs_to :project
  has_many :survey_questions
  has_many :survey_data
end
