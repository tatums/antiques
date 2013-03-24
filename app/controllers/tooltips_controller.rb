class TooltipsController < ApplicationController
  before_filter :require_user
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.toggle_tooltips
        format.js
      end
    end
  end


end
