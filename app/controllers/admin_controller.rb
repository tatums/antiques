class AdminController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end

  def disabled_products
    @products = Product.inactive
  end  

end
