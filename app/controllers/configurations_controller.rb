class ConfigurationsController < ApplicationController
  before_filter :require_user

  def index
    @configurations = ::Configuration.find(:all)
  end

  def show
    @configuration = ::Configuration.find(params[:id])
  end

end