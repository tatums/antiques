class InvoicePdf < Prawn::Document
  def initialize(invoice, view)
    super(top_margin: 70)
    @invoice = invoice
    @view = view
    logo_and_title
    left_head
    right_head
    invoice_number
    line_items
    footer
    #pdf.font("/myfont.ttf")

  end

  def logo_and_title
    prawn_logo = File.open(Rails.root + "app/pdfs/tree-logo.png")
    bounding_box [240, 700], :width => 500 do
      image prawn_logo
    end
    move_down 20
    text "PHOEBE BOOTH ANTIQUES LLC", :size => 16, :align => :center, style: :bold
  end


  def left_head
    bounding_box([0,550], :width => 200, :height => 50) do
      #stroke_bounds
      text "2145 North Dayton Street, CH", :size => 10
      text "Chicago, IL 60614", :size => 10
      text "PHONE: 917-597-4368", :size => 10
    end
  end

  def right_head
    #coordinates ([X, Y])
    bounding_box([470,550], :width => 100, :height => 50) do
      text "Invoice", size: 20, style: :bold
    end
  end

  def invoice_number
     text "Invoice \##{@invoice.id}", size: 12, style: :italic
  end

  def line_items
      move_down 70
      rectangle [0,25], 550, 1
      rectangle [0,0], 550, 1


       table line_item_rows do
         row(0).font_style = :bold
         columns(1..4).align = :right
         self.row_colors = ["DDDDDD", "FFFFFF"]
         self.header = true
         self.width = 540
       end
  end

  def line_item_rows
    [[" ", "Product", "Qty", "Price", "Total Price"]] +
    @invoice.line_items.map do |item|
      [item.position, item.description, item.quantity, item.price, price(item.total)]
    end
  end

  def price(num)
    @view.number_to_currency(num)
  end


  def footer
    bounding_box [0, 15], :width => 500 do
      text "PHOEBE BOOTH ANTIQUES LLC | 2145 North Dayton Street, CH, Chicago, IL 60614 | PHONE: 917-597-4368", :size => 9, :align => :center
    end
  end


end