class Project < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :phase_num, presence: true
  validates :website_link, presence: true
  validates :github_link, presence: true
  validates :blog_link, presence: true
  validates :video_link, presence: true
  validates :user_id, presence: true
end
