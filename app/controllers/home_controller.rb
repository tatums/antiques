class HomeController < ApplicationController
  def index
    @sliders = Slider.active.order(:position)
  end

  def about
  end

  def search
  end

  def new_acquisitions
    @products = Product.new_acquisitions.order(:position)
    render 'products/index'
  end

  def phoebes_finds
    @products = Product.phoebe_finds.order(:position)
    render 'products/index'
  end
  
<<<<<<< HEAD
  # def subscribe
  #   @email = Email.new
  #   render 'emails/new'
  # end

  def thank_you
    
=======
  def subscribe
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
  end

end
