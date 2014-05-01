# app\controllers\products_controller.rb

class ProductsController < ApplicationController

	before_filter :check_authorization, :except => [:index, :show, :display_products_by_city, :multi_find ]

	# use the class method 'find' to get all products, in alphabetical order
	# similar to "SELECT * FROM PRODUCTS ORDER BY TITLE"
	# "@products" represents a collection of different product objects
	def index
		# @products = Product.find :all, :order => 'title'
		#@products = Product.search(params[:search], params[:page])	
		@products = Product.find(:all)
		#@products = Product.order(:title).page(params[:page]).per(9)
		@products = Kaminari.paginate_array(@products).page(params[:page]).per(6)    
	end

	# use a class method to find a product by its id
	# similar to "SELECT * FROM PRODUCTS WHERE PRODUCT.ID  = params[:id]"
	# assign the product object to an instance variable, or nil
	def show
		@product = Product.find(params[:id])
	end

	
	# a new empty Product object, all attributes are blank, 
	# sent to the view 'new.html.erb', @product is used in an empty form
	def new
		@product = Product.new
	end

	# use a class method to find an existing product by its id 
	# assign the product object to an instance variable
	# sent to view 'edit.html.erb', @product is used to populate a form
	def edit
		@product = Product.find(params[:id])
	end

	# in params[:product] ':product' is an object with all attribute values 
	# populated from a form used in 'new' above
	# the attributes in :product are used in a new method to create a new
	# product object. If the object's values are saved to the database
	# then a flash notice is displayed, else the 'new' action is called again 
	# so a user can alter any errors ...
	def create
		@product = Product.new(params[:product])
		if @product.save
			redirect_to @product, notice: "'#{@product.title}' was successfully created." 
		else
			render action: "new" 
		end
    end
 
	# after a form used to edit a record is submitted, this update action is run.
	# using params[:id] the record of the edited product is retrieved from the database,
	# the update method uses :product (attributes from the form used to edit the record)
	# to update this record. 
    # if successful this action redirects the user to show.html.erb or it will again
	# render / display the edit form to correct any invalid data
	 
	# when editing, the file_field img_url textbox holds the value of a product's newly 
	# browsed filename, while the textbox img_url displays any existing filename.
	# if a new filename has not been selected the file_field will remain empty but will
	# be used to update the product's record. 
	def update
		# temp_url_string is used to temporarily save an existing product's img_url filename, 
		temp_url_string = Product.find(params[:id]).img_url
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
			# if the updated product's img_url attribute is blank
			if @product.img_url.empty? 
				# this copy of the filename string is assigned to the img_url attribute 
				@product.update_attribute(:img_url, temp_url_string)
			end
			# redirect_to @product, notice: 'Product was successfully updated.'
			# redirect_to @product, notice: "'" + @product.title + "'" + " was successfully updated."
			redirect_to @product, notice: "'#{@product.title}' was successfully updated." 
		else
			render action: "edit" 
		end
	end
	
	# use a class method to find a product by its id 
	# then send the message 'destroy' to delete the record from the database
	# redirect to products_path which means ... products#index, to display all objects
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		# redirect to display all products
		redirect_to products_path
	end
		

	
	# assign to an instance variable '@products' all objects with the exact title of 
	# search_string, and then uses this instance variable in action index when all 
	# these objects are displayed
	def search
		# @products = Product.simple_search(params[:search_string])
		# return all objects with a title similar to the value of search_string
		
		@products = Product.fuzzy_search2(params[:search_string])
		# new line below ... 
		@products = Kaminari.paginate_array(@products).page(params[:page]).per(6)
		
		# test if the instance variable @products is empty (no objects were found)
		if @products.empty?
			# assign a warning message to the flash hash to be displayed in
			# the div "feedback-top"
			flash.now[:alert] = "No records found - displaying all records ..."
			# return all products, in alphabetical order
			# @products = Product.find :all, :order => 'title'
			@products = Product.order(:title).page(params[:page]).per(6)
		end
		# display the view page index.html.erb associated with action "index"
		render :action => "index"	
	end
	
	def display_products_by_city
		@products = Product.find_all_by_country_id(params[:country_id])
		@products = Kaminari.paginate_array(@products).page(params[:page]).per(6)
		if @products.empty?
			# assign a warning message to the flash hash to be displayed in
			# the div "feedback-top"
			flash.now[:alert] = "No city selected - displaying all records ..."
			# return all products, in alphabetical order
			# @products = Product.find :all, :order => 'title'
			@products = Product.order("title").page(params[:page]).per(6)
		end
		render :action => "index"
	end	
	
	def multi_find	
		# assign to an instance variable values returned from a class method 
		# 'multi_find' to find all products by both category id, using params[:cat_id] 
		# and a search string
		@products = Product.multi_find(params[:country_id], params[:region_id], params[:search_string])
		@counter = @products.count 	
		# assign to an instance variable values returned from the Kaminari class
		# using the paginate array class method with pages set to '6'
		@products = Kaminari.paginate_array(@products).page(params[:page]).per(6)
		# test if the instance variable is empty
		 if @products.empty?
			# assign a warning message to the flash hash to be displayed in
			# the div "feedback-top" indicating no records found - displaying all records
			 flash.now[:notice] = "No records found - displaying all records"
			# return all products, in alphabetical order
			# @products = Product.find :all, :order => 'title'
			@products = Product.find(:all)
			@products = Kaminari.paginate_array(@products).page(params[:page]).per(6)    
		 end
		# otherwise render the home page using the index action
		render :action => "index"
	
		
	end	
end


