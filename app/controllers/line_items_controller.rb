class LineItemsController < ApplicationController
  before_filter :require_user
  respond_to :html, :js

  def edit
    @line_item = LineItem.find(params[:id])
    respond_with(@line_item)
  end

  def update
    @line_item = LineItem.find(params[:id])
    if @line_item.update_attributes(params[:line_item])
      flash[:notice] = 'Line Item was successfully updated.'
    end
    respond_with(@line_item)
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @line_item = setup_line_item
    if @line_item.save
      flash[:notice] = 'Line Item was successfully created.'
    end
    respond_with(@line_item)
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    respond_with(@line_item, location: @line_item.invoice)
  end

private

  def setup_line_item
    if params[:product_id]
      find_product_and_set_params
    else
      @invoice.line_items.build(params[:line_item])
    end
  end

  def find_product_and_set_params
    @product = Product.find(params[:product_id])
    @product.set_as_sold_and_move_to_sold_category
    @invoice.setup_line_item_from(@product)
  end

end
