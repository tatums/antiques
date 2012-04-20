class LineItemsController < ApplicationController
  respond_to :html, :js

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def update
    @line_item = LineItem.find(params[:id])
    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item.invoice, notice: 'Line Item was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    if params[:product_id]
      find_product_and_set_params
    else
      @line_item = @invoice.line_items.build(params[:line_item])
    end
    respond_to do |format|
      if @line_item.save
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

private
  def find_product_and_set_params
    @product = Product.find(params[:product_id])
    @product.set_as_sold_and_move_to_sold_category
    @line_item = @invoice.line_items.build(:product_id => @product.id, :item_number => @product.item_number, :description => @product.title,
    :price => @product.price, :quantity => 1, :dimensions => @product.dimensions )
  end


end
