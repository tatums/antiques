class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @product = Product.find(params[:product_id])
    @images = @product.images.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @product = Product.find(params[:product_id])
    @image = @product.images.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
    
  end

  # POST /images
  # POST /images.json
  def create
    @product = Product.find(params[:product_id])    
    @image = @product.images.build(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to product_images_path(@product), notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to product_images_path(@image.product), notice: 'Image was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to product_images_path(@image.product) }
      format.json { head :ok }
    end
  end
end
