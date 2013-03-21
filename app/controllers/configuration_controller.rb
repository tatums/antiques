class ConfigurationController < ApplicationController
  before_filter :require_user

  def index
    @configuration = ::Configuration.current
  end

  def edit
    @configuration = ::Configuration.current
  end

  def update
    @configuration = ::Configuration.current
    respond_to do |format|
      if @configuration.update_attributes(params[:configuration])
        format.html { redirect_to configuration_index_path, notice: 'Configuration was successfully updated.' }
      else
        format.html { render action: :edit }
      end
    end
  end

end