class SlidersController < ApplicationController
  respond_to :html, :js
  before_filter :require_user

  def index
    @sliders = Slider.order(:position)
    respond_with(@sliders)
  end

  def new
    @slider = Slider.new
    respond_with(@slider)
  end

  def edit
    @slider = find_slider
  end

  def create
    @slider = Slider.new(params[:slider])
    flash[:notice] = 'Image was successfully created.' if @slider.save
    respond_with(@slider, location: sliders_path)
  end

  def update
    @slider = find_slider
    flash[:notice] = 'Image was successfully updated.' if @slider.update_attributes(params[:slider])
    respond_with(@slider, location: sliders_path)
  end

  def destroy
    @slider = find_slider
    @slider.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to sliders_url }
    end
  end

private

  def find_slider
    Slider.find(params[:id])
  end

end
