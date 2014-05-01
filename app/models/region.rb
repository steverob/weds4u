class Region < ActiveRecord::Base
  attr_accessible :region  
  has_many :products
  
	def region_info
		"#{id} #{region}"
	end
	
	validates :region, :presence => { :message => "Region: cannot be blank ..."}
	validates :region, :length => {:in => 2..20, :message => "Region: must be between two and twenty characters"}
	validates :region, :uniqueness => {:case_sensitive => false, :message => "Region: must be unique"}
end




