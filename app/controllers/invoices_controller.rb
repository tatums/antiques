class InvoicesController < ApplicationController
  before_filter :require_user

  def index
    @invoices = Invoice.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    @subscriber = @invoice.subscriber
    respond_to do |format|
      format.html # show.html.erb
      #format.pdf { render :layout => false }
      format.pdf do
          pdf = InvoicePdf.new(@invoice, view_context)
          send_data pdf.render, filename: "order_#{@invoice.id}",
                                        type: "application/pdf",
                                        disposition: "inline"
      end
    end
  end

  def new
    @invoice = Invoice.new
    if params[:product_id]
      @product = Product.find(params[:product_id])
      @invoice.line_items.build(:product_id => @product.id, :item_number => @product.item_number, :description => @product.title,
      :price => @product.price, :quantity => 1, :dimensions => @product.dimensions )
    end
    respond_to do |format|
      format.html # new.html.erb
    end
  end


  def edit
    @invoice = Invoice.find(params[:id])
  end


  def create
    @invoice = Invoice.new(params[:invoice])
    if params[:product_id]
      @product = Product.find(params[:product_id])
      @invoice.line_items.build(:product_id => @product.id, :item_number => @product.item_number, :description => @product.title,
      :price => @product.price, :quantity => 1, :dimensions => @product.dimensions )
    end
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end


  def update
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end


  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url }
    end
  end

  def email_invoice
    @invoice = Invoice.find(params[:invoice_id])
    @pdf = InvoicePdf.new(@invoice, view_context)
    InvoiceMailer.send_invoice(@invoice, @pdf).deliver
    redirect_to @invoice, notice: 'Invoice was sent.'
  end

end
