class SlidersController < ApplicationController
  before_filter :require_user

  def index
    @sliders = Slider.order(:position)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sliders }
    end
  end

  def new
    @slider = Slider.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @slider }
    end
  end


  def edit
    @slider = Slider.find(params[:id])
  end

  def create
    @slider = Slider.new(params[:slider])
    respond_to do |format|
      if @slider.save
        format.html { redirect_to sliders_url, notice: 'Slider was successfully created.' }
        format.json { render json: @slider, status: :created, location: @slider }
      else
        format.html { render action: "new" }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @slider = Slider.find(params[:id])
    respond_to do |format|
      if @slider.update_attributes(params[:slider])
        format.html { redirect_to sliders_url, notice: 'Slider was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @slider = Slider.find(params[:id])
    @slider.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to sliders_url }
      format.json { head :ok }
    end
  end

  def sort
    params[:SlidersOrder].each_with_index do |id, index|
      Slider.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
    end
    render :nothing => true
  end

  def toggle
    @slider = Slider.find(params[:id])
    @slider.toggle_active

    respond_to do |format|
      format.html { redirect_to sliders_url }
      format.json { head :ok }
    end

  end

end
