class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :show_tooltips?

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

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

  def require_user
    unless current_user
      store_location
      flash[:alert] = "You must be logged in to access this page"
      redirect_to login_path
      return false
    end
  end

  def store_location
     session[:return_to] = request.url
  end

  def redirect_back_or_default(default, message)
    flash[:notice] = message
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def show_tooltips?
    @current_user.show_tooltips
  end


end
