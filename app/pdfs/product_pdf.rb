class ProductPdf < Prawn::Document
  include Rails.application.routes.url_helpers
  default_url_options[:host] = 'www.phoebeboothantiques.com'

  def initialize(product)
    super(top_margin: 70)
    @product = product
    logo_and_title
    move_down 20
    inventory_number
    product_image
    move_down 40
    bounding_box [0, 150], :width => 500 do
      description
      move_down 20
      copy
    end
  end

  def logo_and_title
    logo = File.open(Rails.root + "app/assets/images/phoebe_booth.png")
    bounding_box [-30, 720], :width => 600 do
      image logo
    end
    move_down 10
    #text "PHOEBE BOOTH ANTIQUES LLC", :size => 16, :align => :center, style: :bold
  end

  def inventory_number
    text "Inventory #\ #{@product.item_number}", size: 12, style: :bold, align: :center
  end

  def product_image
    if @product.image_url
      product_img = File.open(Rails.root + "public/#{@product.image_url(:thumb_300)}")
    end

    bounding_box [120, 580], :width => 300 do
    if product_img
      image product_img
    end

    end
  end

  def description
      text "#{@product.title}", size: 18, align: :left
      move_down 10
      text "#{@product.body}", size: 12, align: :left
      move_down 10
      text "#{product_url(@product)}" #@product
  end

  def copy
    text "Images are property of Phoebe Booth Antiques LLC. Any reproductions of the inventory within the image require consent.", size: 10, style: :italic, align: :left
  end

end