class Institution < ActiveRecord::Base
  attr_accessible :address, :city, :institution_id, :name, :phone, :state, :zip
end
