class InvoicesController < ApplicationController
  before_filter :require_user

  def index
    @invoices = Invoice.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    @email = @invoice.subscriber.email if @invoice.subscriber
    respond_to do |format|
      format.html
      format.pdf do
          pdf = InvoicePdf.new(@invoice, view_context)
          send_data pdf.render, filename: "order_#{@invoice.id}",
                                        type: "application/pdf",
                                        disposition: "inline"
      end
    end
  end

  def create
    @invoice = Invoice.new(params[:invoice])
    setup_for_params
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    setup_for_params
    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.js
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

  ##TODO Consider moving this into its own controller
  def email_invoice
    @invoice = Invoice.find(params[:invoice_id])
    @pdf = InvoicePdf.new(@invoice, view_context)
    @email = params[:email]["email"]
    InvoiceMailer.send_invoice(@invoice, @pdf, @email).deliver if @email
    redirect_to @invoice, notice: 'Invoice was sent.'
  end

private

  def  setup_for_params
    if params[:subscriber_id] #post comming in from subscriber
      @invoice.subscriber_id = params[:subscriber_id]
    end
    if params[:subscriber] #post comming in from invoice form
      @invoice.subscriber_id = params[:subscriber][:id]
    end
    if params[:product_id]
      @product = Product.find(params[:product_id])
      @product.update_attributes(:sold => Time.now.to_date)
      @invoice.line_items.build(:product_id => @product.id, :item_number => @product.item_number, :description => @product.title,
      :price => @product.price, :quantity => 1, :dimensions => @product.dimensions )
    end

  end

end
