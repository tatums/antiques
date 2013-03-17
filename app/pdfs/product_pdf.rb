class ProductPdf < Prawn::Document
  include Rails.application.routes.url_helpers
  default_url_options[:host] = 'www.phoebeboothantiques.com'
  include ActionView::Helpers::NumberHelper
  include ProductsHelper

  def initialize(product)
    super(top_margin: 70)
    @product = product
    logo_and_title
    move_down 10
    inventory_number
    product_image
    move_down 15
    bounding_box [0, 220], :width => 500 do
      description
      move_down 5
      copy
    end
  end

  def logo_and_title
    logo = File.open(Rails.root + "app/assets/images/phoebe_booth_logo.png")
    bounding_box [125, 730], :width => 300 do
      image logo, :scale => 0.6, :position => :center, :vposition => :top
    end
    # fill_color "#58A51D"
    # #"#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
    # font(Rails.root + "times2.ttf")
    # text "PHOEBE BOOTH ANTIQUES LLC", :size => 32, :align => :center, style: :bold
  end

  def inventory_number
    text "Inventory #\ #{@product.item_number}", size: 12, style: :bold, align: :center
  end

  def product_image
    if @product.image_url

      #if Rails.env.staging?
        product_img = File.open @product.image_url(:large)
      # else
      #   product_img = File.open(Rails.root + "public/#{@product.image_url(:large)}")
      # end

    end

    bounding_box [120, 590], :width => 300 do
      if product_img
        image product_img,:scale => 0.3, :position => :center, :vposition => :top
      end
    end
  end

  def description
      text "#{@product.title}", size: 16, align: :left
      move_down 10
      text "#{@product.body}", size: 12, align: :left
      move_down 10
      text "#{country_and_period(@product)}"
      move_down 5
      text "#{@product.dimensions}"
      move_down 5
      text "#{number_to_currency @product.price}"
      move_down 5

  end

  def copy
    text "#{product_url(@product)}" #@product
    move_down 10
    text "Images are property of Phoebe Booth Antiques LLC. Any reproductions of the inventory within the image require consent.", size: 9, style: :italic, align: :left
  end

  # font "Times-Roman"
  # fill_color "#58A51D"
  # text "PHOEBE BOOTH", :size => 52, :align => :center, style: :bold
  # fill_color 'gray'
  # text "ANTIQUES LLC",:align => :center, style: :normal
  #fill_color "000000"

  #image logo, :scale => 0.6, :position => :center, :vposition => :top

  # fill_color "#58A51D"
  # #"#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
  # font(Rails.root + "times2.ttf")
  # text "PHOEBE BOOTH ANTIQUES LLC", :size => 32, :align => :center, style: :bold


end