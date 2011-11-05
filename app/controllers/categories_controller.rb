class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]


  def index
<<<<<<< HEAD
    @categories = Category.order(:position)
=======
    @categories = Category.all
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end


  def show
<<<<<<< HEAD
   @category = Category.where(:slug => params[:id]).first
   @tags = @category.tags.order('tags.position')
    respond_to do |format|
     format.html # show.html.erb
     format.json { render json: @category }
    end
=======
   #@category = Category.find(params[:id])
   
   @category = Category.where(:slug => params[:id]).first
   
   #@category = Category.find_by_slug!(params[:id])
   
   @products = @category.products.order(:position)
  
   render 'products/index'
   
   
   #@products = Product.order(:position)
   
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @category }
    #end
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
  end


  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end


  def edit
<<<<<<< HEAD
=======
    #@category = Category.find(params[:id])
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
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
<<<<<<< HEAD
=======
    #@category = Category.find(params[:id])

>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
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
<<<<<<< HEAD
=======
    #@category = Category.find(params[:id])
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
    @category = Category.where(:slug => params[:id]).first
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end
  end
  
  def sort
<<<<<<< HEAD
    params[:CategoriesOrder].each_with_index do |id, index|
      Category.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
=======
    params[:ProductsOrder].each_with_index do |id, index|
      Product.where(:id => id.scan(/\d/)).update_all(:position => index+1)
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
    end
    render :nothing => true
  end
  
<<<<<<< HEAD
    
  def toggle
    @category = Category.where(:slug => params[:id]).first
    @category.toggle_active

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end
    
  end
  
  
=======
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
end
