class VisitorViewController < ApplicationController
  def create
    store_referer
    enable_visitor_view
    redirect_back_to('Visitor View Enabled')
  end

  def destroy
    store_referer
    disable_visitor_view
    redirect_back_to('Visitor View Disabled')
  end
end
