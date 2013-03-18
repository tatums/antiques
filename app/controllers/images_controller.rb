class ImagesController < ApplicationController
  before_filter :require_user


  def create
    @product = Product.find(params[:product_id])
    @image = @product.images.build(params[:image])
    @image.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to @image.product }
    end
  end
end
