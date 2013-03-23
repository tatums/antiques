class CategoriesController < ApplicationController
  respond_to :html, :js
  before_filter :require_user, :except => [:show]

  def index
    @inactive_categories = Category.inactive.order(:position)
    respond_with(@inactive_categories)
  end

  def show
    @category = find_by_slug
    @products = find_products_for_category(@category).order('category_products.position').page params[:page]
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
    @category = find_by_slug
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
    @category = find_by_slug
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end


  def destroy
    @category = find_by_slug
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
    end
  end

#///////////////////////////////////////////////////////////////////////////

  def sort
    generic_sort(params[:CategoriesOrder], 'Category')
    render :nothing => true
  end

  def sort_products
    generic_sort(params[:products_in_order], 'CategoryProduct', params[:category_id].to_i)
    render :nothing => true
  end

private

  def find_by_slug
    Category.find_by_slug(params[:id])
  end

  def find_products_for_category(category)
    if current_user and !visitor_view
      category.products.includes(:images)
    else
      category.products.includes(:images).active
    end
  end

end
