class SessionsController < ApplicationController
	
	# login
	
	# 'match login' is mapped to sessions#new
	# this will render the sessions form, new.html.erb 
	# here a user can enter their name and password details
	# this form sends these details to the create 
	# action below to check these details are valid
	def new
	end

	# check login details (name and password)
	# this action checks that the name and password entered in the 
	# 'new' form are valid	
	#def create
	#  user = User.find_by_email(params[:email])
  #if user && user.authenticate(params[:password])
   # if params[:remember_me]
    #  cookies.permanent[:auth_token] = user.auth_token
    #else
    #  cookies[:auth_token] = user.auth_token
    #end
    #redirect_to root_url, :notice => "Logged in!"
 # else
  #  flash.now.alert = "Invalid email or password"
   # render "new"
 # end

	# log out
	def destroy
		# the act of logging out is performed by simply setting the key (:user_id) 
		# in the session hash to a value of nil (nothing)
		session[:user_id] = nil
		# redirect to root_path (products/index.html.erb') 
		redirect_to root_path 
	end


	# 'new' form are valid	
	def create
		user = User.find_by_name params[:name]
		if user and user.authenticate params[:password]
			# 'logging in' is performed by saving a user's id in the session variable
			session[:user_id] = user.id
				
			redirect_to session[:return_to] || root_path
		else
			flash.now.alert = "Invalid user/password"
			render :new
		end
	end
end