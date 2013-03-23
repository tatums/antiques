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
    respond_to do |format|
      if @slider.save
        format.html { redirect_to sliders_url, notice: 'Slider was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @slider = find_slider

    respond_to do |format|
      if @slider.update_attributes(params[:slider])
        format.html { redirect_to sliders_url, notice: 'Slider was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
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
