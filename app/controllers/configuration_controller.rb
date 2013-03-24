class ConfigurationController < ApplicationController
  respond_to :html
  before_filter :require_user

  def index
    @configuration = ::Configuration.current
    respond_with(@configuration)
  end

  def edit
    @configuration = ::Configuration.current
    respond_with(@configuration)
  end

  def update
    @configuration = ::Configuration.current
    if @configuration.update_attributes(params[:configuration])
      flash[:notice] = 'Configuration was successfully updated.'
    end
    respond_with(@configuration)
  end

end