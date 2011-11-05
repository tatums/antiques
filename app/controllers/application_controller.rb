class ApplicationController < ActionController::Base
  protect_from_forgery



  def sort
    params[:ProductsOrder].each_with_index do |id, index|
<<<<<<< HEAD
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

=======
      #Product.update_all(['position=?', index+1], ['id=?', id.scan(/\d/)])
      #Product.update_all( {:position => index+1}, {:id => id.scan(/\d/)} )
      Product.where(:id => id.scan(/\d/)).update_all(:position => index+1)
    end
    render :nothing => true
  end
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
  
end
