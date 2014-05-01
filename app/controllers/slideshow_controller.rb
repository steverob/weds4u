class SlideshowController < ApplicationController

   def show
      @slider = Slider.find(params[:id])
      session[:slider] = @slider
      session[:slide_index] = 0
      @slide = @slider.slides[0]
    end

	
	def show_slide
      @slider = session[:slider]
      session[:slide_index] += 1
      @slider = @slider.slides[session[:slide_index]]
      if @slider == nil
         session[:slide_index] = 0
         @slider = @slider.slides[0]
      end
      render :partial => "show_slider"
    end
end
