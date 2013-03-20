class InvoicePdf < Prawn::Document
  def initialize(invoice, view)
    super(top_margin: 70)
    @invoice = invoice
    @view = view
    logo_and_title
    left_head
    right_head
    invoice_number
    date_left
    customer_info_right
    line_items_table
    sales_final
    footer

  end

  def logo_and_title
    prawn_logo = File.open(Rails.root + "app/pdfs/tree-logo.png")
    bounding_box [240, 730], :width => 500 do
      image prawn_logo
    end
    move_down 20
    text "PHOEBE BOOTH ANTIQUES LLC", :size => 16, :align => :center, style: :bold
  end


  def left_head
    bounding_box([0,570], :width => 200, :height => 50) do
      text Configuration.current.line_1, :size => 10
      text Configuration.current.line_2, :size => 10
      text "Phone: #{Configuration.current.phone}", :size => 10
    end
  end

  def right_head
    #coordinates ([X, Y])
    bounding_box([470,570], :width => 100, :height => 50) do
      text "Invoice", size: 20, style: :bold
    end
  end

  def invoice_number
     text "Invoice #\ #{@invoice.inv_number}", size: 12, style: :italic
  end

  def date_left
    table(date_data) do
         row(0).style(:background_color => 'dddddd', align: :center)
         column(0..1).width = 90
         columns(0..1).style(size:10)
         self.header = true
     end

  end


  def customer_info_right
    bounding_box([440,520], :width => 100) do
      text @invoice.contact.full_name if @invoice.contact
      text @invoice.contact.address if @invoice.contact
      text @invoice.contact.city_state_zip if @invoice.contact
    end
  end


  def line_items_table
      bounding_box([0, 430], :width => 550) do
        table line_item_rows do
          column(0).style(:width => 20, align: :center)
          columns(1..4).align
          column(2).style align: :center
          columns(0..4).style(size:10)
          columns(3..4).style align: :right
          row(0).style(:background_color => '666666', :text_color => 'FFFFFF', align: :center)
          self.row_colors = ["DDDDDD", "FFFFFF"]
          self.header = true
          self.width = 540
        end
       move_down 20

        bounding_box([340, 0], :width => 300) do
           table(totals_data) do
               column(0).style(:background_color => 'dddddd', align: :center )
               column(1).style( font_style: :bold, align: :right )
               column(0..1).width = 100
               columns(0..1).style(size:10)
           end
        end
     end

  end

  def sales_final
    move_down 20
    text "Please make all checks payable to Phoebe Booth Antiques LLC.", :size => 10
    text "All sales final, no returns.", :size => 10
  end

  def date_data
    [[ "Date", "Tax ID"], [@invoice.inv_date.strftime('%m/%d/%Y') , ' ']]

  end

  def totals_data
    [['Subtotal:', price(@invoice.calc_sub_total)],
      ['Tax:', price(@invoice.calc_tax_total)],
      ['Grand Total:', price(@invoice.calc_grand_total)] ]
  end



  def footer
    bounding_box [0, 10], :width => 500 do
      text Configuration.current.footer, :size => 8, :align => :center
      #text "PHOEBE BOOTH ANTIQUES LLC | 2145 North Dayton Street, CH, Chicago, IL 60614 | PHONE: 917-597-4368", :size => 8, :align => :center
    end
  end

  def line_item_rows
    [[" ", "Product", "Qty", @invoice.price_header, "Total Price"]] +
    @invoice.line_items.map do |item|
      [item.position, item.description, item.quantity, price(item.price), price(item.total)]
    end
  end

  def price(num)
    @view.number_to_currency(num)
  end

end