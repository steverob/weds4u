class ErrorsController < ApplicationController
  
  def routing
      flash[:alert] = "No such path as '" + params[:a] + "'"
      redirect_to root_path
    end
    
end