class Education < ActiveRecord::Base
  attr_accessible :activities, :degree, :end_year, :study, :gpa, :notes, :school, :start_year, :user_id
  belongs_to :user
  
  validates :school, presence: true
end
