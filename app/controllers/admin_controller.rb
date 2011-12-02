class AdminController < ApplicationController
  
  def index
  end

  def disabled_products
    @products = Product.inactive
  end  

end
