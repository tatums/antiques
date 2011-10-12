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
  
  def subscribe
  end

end
