class LineItemsController < ApplicationController

  def create
    @invoice = Invoice.find(params[:invoice_id])
    if params[:product_id]
      find_product_and_set_params
    else
      @line_item = @invoice.line_items.build(params[:line_item])
    end
    respond_to do |format|
      if @line_item.save
        #format.html
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

protected
  def find_product_and_set_params
    @product = Product.find(params[:product_id])
    @line_item = @invoice.line_items.build(:product_id => @product.id, :item_number => @product.item_number, :description => @product.title,
    :price => @product.price, :quantity => 1, :dimensions => @product.dimensions )
  end


end
