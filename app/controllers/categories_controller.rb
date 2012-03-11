class CategoriesController < ApplicationController
  before_filter :require_user, :except => [:show]


  def index
    @categories = Category.order(:position)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end


  def show
    @category = Category.where(:slug => params[:id]).first
    @products = @category.products.active.order('category_products.position').page params[:page]
    respond_to do |format|
     format.html # show.html.erb
     format.json { render json: @category }
    end

  end


  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
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
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    @category = Category.where(:slug => params[:id]).first
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
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
    @category = Category.where(:slug => params[:id]).first
    @category.toggle_active
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end

  end

end
