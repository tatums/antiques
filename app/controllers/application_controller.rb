class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :show_tooltips?
  helper_method :store_referer
  helper_method :redirect_back_to
  helper_method :visitor_view

private

  def generic_sort(items, klass, category_id=nil)
    items.each_with_index do |id, index|
      if category_id
        klass.constantize.where(:product_id => id.scan(/\d+/), :category_id => category_id).update_all(:position => index+1)
      else
        klass.constantize.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
      end
    end
  end

  def visitor_view
    session[:visitor_view]
  end

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

  def store_referer
     session[:return_back_to] = request.referer
  end

  def redirect_back_or_default(default, message)
    flash[:notice] = message
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def redirect_back_to(message)
    flash[:notice] = message
    redirect_to(session[:return_back_to] || groups_path)
    session[:return_back_to] = nil
  end

  def show_tooltips?
    @current_user.show_tooltips
  end

  def enable_visitor_view
    session[:visitor_view] = true
  end

  def disable_visitor_view
    session.delete('visitor_view')
  end

end
