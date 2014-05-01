class Country < ActiveRecord::Base
  attr_accessible :city
  has_many :products
  
  def country_info
		"#{id} #{city}"
	end
	
	validates :city, :presence => { :message => "City: cannot be blank ..."}
	validates :city, :length => {:in => 2..20, :message => "City: must be between two and twenty characters"}
	validates :city, :uniqueness => {:case_sensitive => false, :message => "City: must be unique"}
end

  
