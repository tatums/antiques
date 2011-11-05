class ApplicationController < ActionController::Base
  protect_from_forgery



  def sort
    params[:ProductsOrder].each_with_index do |id, index|
      Product.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
    end
    render :nothing => true
  end

  def sort_measurements
    params[:MeasurementsOrder].each_with_index do |id, index|
      Measurement.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
    end
    render :nothing => true
  end
  
end
