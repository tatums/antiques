class CategoriesController < ApplicationController
  before_filter :require_user, :except => [:show]


  def index
    @categories = Category.order(:position)
    respond_to do |format|
      format.html # index.html.erb
    end
  end


  def show
    @category = Category.where(:slug => params[:id]).first
    if current_user
      @products = @category.products.order('category_products.position').page params[:page]
    else
      @products = @category.products.active.order('category_products.position').page params[:page]
    end
    respond_to do |format|
     format.html
    end

  end


  def new
    @category = Category.new

    respond_to do |format|
      format.html
    end
  end


  def edit
    @category = Category.where(:slug => params[:id]).first
  end



  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end



  def update
    @category = Category.where(:slug => params[:id]).first
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end


  def destroy
    @category = Category.where(:slug => params[:id]).first
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end
  end

#///////////////////////////////////////////////////////////////////////////

  def sort
    params[:CategoriesOrder].each_with_index do |id, index|
      Category.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
    end
    render :nothing => true
  end

  def sort_products
    params[:products_in_order].each_with_index do |id, index|
      CategoryProduct.where(:product_id => id.scan(/\d+/), :category_id => params[:category_id].to_i).update_all(:position => index+1)
    end
    render :nothing => true
  end


  def toggle
    @category = Category.find_by_slug(params[:id])
    @category.toggle_active
    respond_to do |format|
      format.html { redirect_to categories_url }
    end

  end

end
