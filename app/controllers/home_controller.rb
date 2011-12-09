class HomeController < ApplicationController
  def index
    @sliders = Slider.active.order(:position)
  end

  def about
  end

  def search
    
    if params[:query]
      @products = Product.search do
        keywords params[:query]
      end
      @results = @products.results
    end
  end

  def phoebes_finds
    @products = Product.phoebe_finds.active.order(:position).page params[:page]
  end
  

  def thank_you
  end
  
  def contact
    # @subscriber = Subscriber.new
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @contact }
    # end
  end




end
