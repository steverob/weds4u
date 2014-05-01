class BookingsController < ApplicationController
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookings }
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booking }
    end
  end

	def new
		# if logged in
		 if logged_in?
			@booking = Booking.new(:product_id => params[:product_id], :name => User.find(session[:user_id]).name)			 
			# set the session variable 'return to' key, to nil
			session[:return_to] = nil
		 else
			# set the session variable 'return to', to the requested url 
			session[:return_to] = request.url
			# redirect to login with an alert message indicating that a user needs to login to write a booking
			 redirect_to login_path, alert: ' "You need to login to make a booking" '
		 end
	end
	
	
  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

 
	def create
		# use the class method 'new' with the parameter 'review', populated 
		# with values from a form 
		@booking = Booking.new(params[:booking])
    @booking.user_id = session[:user_id]
		# attempt to save to the database, the new review instance variable 
		if @booking.save
			redirect_to @booking.product, notice: 'Venue successfully booked. Congratulations! :)'
		else
			# if the booking could not be saved, return / render the new form
			render action: "new"
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.json
  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url }
      format.json { head :no_content }
    end
  end
  
	def displays
		product  = Product.find(params[:id])
		@bookings = product.bookings
		if @bookings.empty?
			# product = Product.find(params[:id])
			redirect_to product_path, notice: "No bookings - as yet ..."
		end
	end   

end
