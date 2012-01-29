class LineItemsController < ApplicationController

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @line_item = @invoice.line_items.build(params[:line_item])
    respond_to do |format|
      if @line_item.save
        format.js
      else
        format.js {redirect_to @line_item.invoice, notice: 'Line Item was NOT successfully created.'}
      end
    end
  end


end
