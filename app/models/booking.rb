class Booking < ActiveRecord::Base
  # attr_accessible :title, :body
  
  attr_accessible :name, :tel, :address, :user_id, :guests_count, :date, :product_id
  
  belongs_to :product
  belongs_to :user
  
  validates :product_id, :uniqueness => {:scope => :date, message: "Venue already booked for this date!"}

end
