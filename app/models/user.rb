class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :password, :password_confirmation, :graduate, :benefactor
  has_secure_password
  has_many :educations
  has_one :story
  
  before_save { |user| user.email = email.downcase }
  
  validates :first, presence: true, length: { maximum: 30 }
  validates :last, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validate :graduate_or_benefactor?
  
  def full_name
    first + ' ' + last
  end

  def graduate_or_benefactor?
    if graduate == false && benefactor == false
      errors.add(:graduate, "or Benefactor must be selected")
    end
  end

end
