class ProductsController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy]

  def index
    if current_user
      @products = Product.includes(:images).order(:position).page params[:page]
    else
      @products = Product.includes(:images).active.order(:position).page params[:page]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end


  def show
    @product = Product.find(params[:id])
    @notes = @product.notes
    respond_to do |format|
      format.html
      format.pdf do
          pdf = ProductPdf.new(@product)
          send_data pdf.render, filename: "product_#{@product.id}",
                                        type: "application/pdf",
                                        disposition: "inline"
      end

    end
  end


  def new
    @product = Product.new
    @product_categories = @product.category_ids

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  def edit
    @product = Product.find(params[:id])
    @product_categories = @product.category_ids

  end

  def create
    @product = Product.new(params[:product])
    @product_categories = @product.category_ids

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
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
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end


  def sort
    params[:ProductsOrder].each_with_index do |id, index|
      Product.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
    end
    render :nothing => true
  end



end
