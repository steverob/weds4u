class ApplicationController < ActionController::Base
	protect_from_forgery

  
  	# recover from an error generated when a request is made for a record 
	# with an 'id' that does not exist
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

	# make these methods available / visible in views 
	helper_method :the_date, :active_menu, :admin?, :logged_in?, :logged_in_as, :acting_role
				  
	def the_date
		Time.now.strftime("%A #{Time.now.day.ordinalize} %B")
	end
		
	def active_menu(controller_name)
		if params[:controller] == controller_name
			'highlight_active'
		else
			'highlight_inactive'
		end
	end
	
	def admin?
		if logged_in?
			User.find(session[:user_id]).role == 'admin'
		end
	end
	
	def logged_in?
		not session[:user_id].nil? 
	end
	
	def logged_in_as
		if logged_in?
			User.find(session[:user_id]).name + " is logged in"
		end
	end
	
	def acting_role
		if admin?
			" as administrator"
		end
	end
	
	private # these methods below can only be called by the object itself
	
	def record_not_found
		flash[:alert] = "Cannot find record number " + params[:id] + ". Displaying all records."
		redirect_to root_path 
	end
  
	def check_authorization
		user_not_authorized unless admin?
    end
  
	def user_not_authorized		
		message = "Please login "
		if params[:controller] == 'users'
			message += " as an administrator"
		elsif params[:action] == 'new'			
			message += " to create a new object." 		
		else			
			message += " to #{params[:action] } an object." 		
		end		
		flash[:alert] = message		
		redirect_to root_path 	
	end

	
	
def current_user
  @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
end


end
