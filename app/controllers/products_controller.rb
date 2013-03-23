class ProductsController < ApplicationController
  respond_to :html, :js
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy]

  include Sort

  def index
    @products = find_products
    respond_with(@products)
  end

  def show
    @product = Product.find(params[:id])
    @notes = @product.notes
    respond_to do |format|
      format.html
      format.pdf { send_data ProductPdf.new(@product).render,
                  filename: "product_#{@product.id}", type: "application/pdf", disposition: "inline" }
    end
  end

  def new
    @product = Product.new
    @product_categories = @product.category_ids
    respond_with(@product)
  end

  def edit
    @product = Product.find(params[:id])
    @product_categories = @product.category_ids
    respond_with(@product)
  end

  def create
    @product = Product.new(params[:product])
    @product_categories = @product.category_ids

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    params[:product][:category_ids] ||= []
    @product = Product.find(params[:id])
    @product_categories = @product.category_ids

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
    end
  end


private

  def find_products
   if current_user and !visitor_view
      Product.includes(:images).order(:position).page params[:page]
    else
      Product.includes(:images).active.order(:position).page params[:page]
    end
  end

end
