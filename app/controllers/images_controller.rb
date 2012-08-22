class ImagesController < ApplicationController
  before_filter :require_user


  def create
    @product = Product.find(params[:product_id])
    @image = @product.images.build(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to @product, notice: 'Image was successfully created.' }
        format.json { render :json => { :image_url => @image.image_url(:thumb_200) }, :content_type => 'text/html'}
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

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
