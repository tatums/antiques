class CategoriesController < ApplicationController
  include Sort
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
    if @category.save
        flash[:notice] = 'Category was successfully created.'
    end
    respond_with(@category)
  end

  def update
    @category = find_by_slug
    #@category = Category.new(params[:category])
    if @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
    end
    respond_with(@category)
  end

  def destroy
    @category = find_by_slug
    @category.destroy
    respond_with(@category)
  end

  def sort_products
    generic_sort(params[:products_in_order], 'CategoryProduct', params[:category_id].to_i)
    render :nothing => true
  end

private

  def find_by_slug
    Category.find_by_slug(params[:id])
  end

end
