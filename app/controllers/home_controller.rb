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

  def subscribe
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(params[:contact])
    respond_to do |format|
      if @contact.save
        SubscriberMailer.subscribe(@contact).deliver
        format.html { redirect_to category_path(Category.active.sample), notice: 'Thank You... You infomation was successfully saved.' }
      else
        format.html { render action: "subscribe" }
      end
    end
  end

end
