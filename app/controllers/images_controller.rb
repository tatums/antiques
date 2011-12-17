class ImagesController < ApplicationController
  before_filter :require_user
  
  # def index
  #   @product = Product.find(params[:product_id])
  #   @images = @product.images.all
  # 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @images }
  #   end
  # end


  # def show
  #   @image = Image.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @image }
  #   end
  # end

  # def new
  #   @product = Product.find(params[:product_id])
  #   @image = @product.images.build
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @image }
  #   end
  # end

  # def edit
  #   @image = Image.find(params[:id])
  #   
  # end

  def create
    @product = Product.find(params[:product_id])    
    @image = @product.images.build(params[:image])

    respond_to do |format|
      if @image.save
        #DOC Tried a JS response here... but can't send multi-part data remotely without iframe hackish stuff. =)
        format.html { redirect_to @product, notice: 'Image was successfully created.' }
        format.json { render json: @image.product, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end


  # def edit
  #   @image = Image.find(params[:id])
  # end
  # 
  # def update
  #   @image = Image.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @image.update_attributes(params[:image])
  #       format.html { redirect_to product_images_path(@image.product), notice: 'Image was successfully updated.' }
  #       format.json { head :ok }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @image.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to @image.product }
      format.json { head :ok }
    end
  end
end
