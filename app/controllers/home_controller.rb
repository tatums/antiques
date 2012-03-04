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

  def subscribe
    @subscriber = Subscriber.new
  end

  def create_subscriber
    @subscriber = Subscriber.new(params[:subscriber])
    respond_to do |format|
      if @subscriber.save
        SubscriberMailer.subscribe(@subscriber).deliver
        format.html { redirect_to thank_you_path, notice: 'Subscriber was successfully saved.' }
      else
        format.html { render action: "subscribe" }
      end
    end
  end

end
