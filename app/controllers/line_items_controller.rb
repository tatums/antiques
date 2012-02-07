class LineItemsController < ApplicationController

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @line_item = @invoice.line_items.build(params[:line_item])
    respond_to do |format|
      if @line_item.save
        @inv = @line_item.invoice
        format.js
      else
        format.js {redirect_to @line_item.invoice, notice: 'Line Item was NOT successfully created.'}
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to @line_item.invoice }
      format.js
    end
  end

end
