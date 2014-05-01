# app\models\product.rb

class Product < ActiveRecord::Base
	attr_accessible :title, :description, :img_url, 
	:price, :capacity, :contact, :telephone, :website, :address, :country_id, :book_id, :region_id
  
	belongs_to :country
	has_many :books             # what is this?
	belongs_to :region

	has_many :bookings
	has_many :users, through: :bookings

	#validates :title, :presence => { :message => "Title: cannot be blank ..."}
	#validates :title, :length => {:in => 2..40, :message => "Title: must be between two and thirty five characters"}
 
	#validates :description, :presence => { :message => "Description: cannot be blank ..."}
	#validates :description, :length => {:maximum => 2000, :message => "Description: maximum length 2000 characters"} 
	
	#validates :capacity, :presence => { :message => "Capacity: cannot be blank ..."}
	
	#validates :price, :presence => { :message => "Price: cannot be blank ..."}
	#validates :price, :length => {:maximum => 10000, :message => "Price: maximum length 2000 characters"} 
    
	#validates :img_url, :allow_blank => true, :format=> {:with => %r{\.(gif|jpg|png)$}i, :message => "Image url: must be a URL for GIF, JPG or PNG images."}
	
	#validates :contact, :presence => { :message => "Contact: cannot be blank ..."}
	#validates :contact, :length => {:maximum => 2000, :message => "Contact: maximum length 2000 characters"} 
	
	#validates :telephone, :presence => { :message => "Telephone: cannot be blank ..."}
	#validates :telephone, :length => {:maximum => 2000, :message => "Telephone: maximum length 11 characters"} 

	#validates :website, :presence => { :message => "Website: cannot be blank ..."}

	#validates :address, :presence => { :message => "Address: cannot be blank ..."}
	#validates :address, :length => {:maximum => 2000, :message => "address: maximum length 2000 characters"} 		
	

	# a simple search which returns all objects whose title 
	# is the same as the value of a search_string
	def self.simple_search(search_string)
		self.find(:all, :conditions => ["title = ?", search_string])
	end
	
	
	

def self.search(search, page)
  paginate :per_page => 5, :page => page,
           :conditions => ['title like ?', "%#{search}%"],
           :order => 'title'
end

	
	# a fuzzy search which returns all objects whose title 
	# contains some part of the value of a search_string
	def self.fuzzy_search(search_string)
		search_string = "%" + search_string + "%"
		self.find(:all, :conditions => ["title LIKE ?", search_string])
	end
	
	# return all products that have the value of 'search_string' 
	# somewhere in their 'title' or 'author_name'
    def self.fuzzy_search2(search_string)
		search_string = "%" + search_string + "%"
		#  find all where a search string is like a title or an author's name
		self.find(:all, :conditions => ["title LIKE ? OR price  LIKE ?", 
		# order by title
		search_string, search_string ], order: 'title')
    end
    
	# return all products in a category that have the value of 'search_string' 
	# somewhere in their 'title' or 'author_name' or
	# return all products that have the value of 'search_string' somewhere in their 'title' or 'author_name'
	def self.multi_find(country_id, region_id, search, price)
		results = self

		#in Rails 3.2, ActiveRecord queries can be chained like this :) Dont use "find_by_xxxxx". Its deprecated.

		search_string = "%#{search}%"
		results = results.where("title LIKE ?", search_string)	unless search.blank?

		results = results.where("price <= ?", price)	unless price.blank?

		results = results.where(region_id: region_id) unless region_id.blank?
		
		results = results.where(country_id: country_id) unless country_id.blank?

		results.order 'title'

		# search_string = "%" + search + "%"
		# # test if country_id is not blank
		# if not country_id.blank?
		# 	if not region_id.blank?			
		# 		#if not search.blank?			
				
		# 		# find all by country id where a search string is like a title or an author's name
		# 		self.find_all_by_region_id(region_id, :conditions =>	
		# 		 ['country_id LIKE ? AND (title LIKE ? OR price LIKE ?)', country_id, search_string, search_string])
		# 	 else
		# 		# find all where a search string is like a title or an author's name
		# 		self.find_all_by_country_id(country_id, :conditions => ["title LIKE ? OR price  LIKE ?", 
		# 		# order by title 
		# 		search_string, search_string ], order: 'title')			
		# 	 end	
		#  else
		# 	if not region_id.blank?
		# 	# find all where a search string is like a title or an author's name
		# 	self.find_all_by_region_id(region_id, :conditions => ["title LIKE ? OR price  LIKE ?", 
		# 	# order by title 
		# 	search_string, search_string ], order: 'title')		
		# 	else			
		# 	self.find(:all, :conditions => ["title LIKE ? OR price  LIKE ?", 
		# 	# order by title 
		# 	search_string, search_string ], order: 'title')		
		#  end
		#  end
	end 
	

end
