class ReviewsController < ApplicationController
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

	def new
		# if logged in
		 if logged_in?
			# parameters of the 'new' method include the product id and the name of the user logged in
			# found by a search using the user id of the session variable
			 @review = Review.new(:product_id => params[:id], :name => User.find(session[:user_id]).name)			 
			# set the session variable 'return to' key, to nil
			session[:return_to] = nil
		 else
			# set the session variable 'return to', to the requested url 
			session[:return_to] = request.url
			# redirect to login with an alert message indicating that a user needs to login to write a review
			 redirect_to login_path, alert: ' "You need to login to write a review" '
		 end
	end
	
	
  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

 
		def create
		# use the class method 'new' with the parameter 'review', populated 
		# with values from a form 
		@review = Review.new(params[:review])
		# attempt to save to the database, the new review instance variable 
		if @review.save
			# use the class method 'find' with the id of the product of the 
			# saved review and assign this product object to the variable 'product'
			product = Product.find(@review.product.id)
			# redirect the reviewer to the show page of the product they reviewed,
			# using the product variable, and send a notice indicating the review 
			# was successfully added
			redirect_to product, notice: 'Your review was successfully added.'
		else
			# if the review could not be saved, return / render the new form
			render action: "new"
        end
    end


	

	
	
  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end
  
	def displays
		product  = Product.find(params[:id])
		@reviews = product.reviews
		if @reviews.empty?
			# product = Product.find(params[:id])
			redirect_to product_path, notice: "No reviews - as yet ..."
		end
	end   

end
