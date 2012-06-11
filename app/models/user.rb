class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :password, :password_confirmation
  has_secure_password
  has_many :educations
  has_one :story
  
  before_save { |user| user.email = email.downcase }
  
  validates :first, presence: true, length: { maximum: 30 }
  validates :last, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  
  def full_name
    first + ' ' + last
  end
end
