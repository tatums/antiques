class MeasurementsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @measurements = @product.measurements.order(:position)
    @measurement = @product.measurements.build
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @measurements }
    end
  end

  def show
    @measurement = Measurement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @measurement }
    end
  end

  def new
    @product = Product.find(params[:product_id])
    @measurement = @product.measurements.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @measurement }
    end
  end

  def create
    @product = Product.find(params[:product_id])    
    @measurements = @product.measurements.order(:position)
    @measurement = @product.measurements.build(params[:measurement])
    respond_to do |format|
      if @measurement.save
        format.html { redirect_to product_measurements_path(@product), notice: 'Measurement was successfully created.' }
        format.json { render json: @measurement, status: :created, location: @measurement }
      else
        format.html { render action: "index" }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @measurement = Measurement.find(params[:id])
  end

  def update
    @measurement = Measurement.find(params[:id])
    respond_to do |format|
      if @measurement.update_attributes(params[:measurement])
        format.html { redirect_to product_measurements_path(@measurement.product), notice: 'Measurement was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @measurement = Measurement.find(params[:id])
    @product = @measurement.product
    @measurement.destroy

    respond_to do |format|
      format.html { redirect_to product_measurements_path(@product) }
      format.json { head :ok }
    end
  end
    
  
  def sort
    params[:MeasurementsOrder].each_with_index do |id, index|
      Measurement.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
    end
    render :nothing => true
  end
  
end
