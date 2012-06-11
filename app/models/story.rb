class Story < ActiveRecord::Base
  attr_accessible :future, :past, :user_id
  
  belongs_to :user
end
