class KeywordsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @product = Product.find(params[:product_id])    
    @keyword = @product.keywords.build(params[:keyword])
    respond_to do |format|
      if @keyword.save
        format.html { redirect_to @product, notice: 'Keyword was successfully created.' }
        format.json { render json: @keyword, status: :created, location: @keyword }
      else
        format.html { render action: "new" }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def destroy
  end

end
