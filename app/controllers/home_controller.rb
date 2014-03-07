class HomeController < ApplicationController
  respond_to :html
  #before_filter :require_user

  def index
    @sliders = Slider.active.order(:position)
    respond_with(@sliders)
  end

  def about
  end

  def search
    @products = Product.where(:active => true).search(params[:query]) if params[:query]
    respond_with(@products)
  end

  def phoebes_finds
    @products = Product.phoebe_finds.active.order(:position).page params[:page]
    respond_with(@products)
  end

  def subscribe
    @contact = Contact.new
    respond_with(@contact)
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
