class KeywordsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @product = Product.find(params[:product_id])    
    @keyword = @product.keywords.build(params[:keyword])
    respond_to do |format|
      if @keyword.save
        format.html { redirect_to @product, notice: 'Keyword was successfully created.' }
        format.js
        format.json { render json: @keyword, status: :created, location: @keyword }
      else
        format.html {redirect_to @product, notice: 'Keyword was NOT successfully created.'}
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def destroy
    @keyword = Keyword.find(params[:id])
    @keyword.destroy

    respond_to do |format|
      format.html { redirect_to @product }
      format.js
      format.json { head :ok }
    end
    
  end

end
