class Review < ActiveRecord::Base
	attr_accessible :name, :no_of_stars, :product_id, :review_text
  
	belongs_to :product
  
	validates :review_text, :presence => { :message => "Review text: cannot be blank ..."}
	validates :review_text, :length => {:maximum => 2000, :message => "Review text: maximum length 2000 characters"} 
  
	validates :no_of_stars, :presence => { :message => "Stars: please rate this book ..."}
  
end
