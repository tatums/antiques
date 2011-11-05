class MeasurementsController < ApplicationController
<<<<<<< HEAD

  def index
    @product = Product.find(params[:product_id])
    @measurements = @product.measurements.order(:position)
    @measurement = @product.measurements.build
=======
  # GET /measurements
  # GET /measurements.json
  def index
    @product = Product.find(params[:product_id])
    @measurements = @product.measurements.order(:position)

>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @measurements }
    end
  end

<<<<<<< HEAD
=======
  # GET /measurements/1
  # GET /measurements/1.json
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
  def show
    @measurement = Measurement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @measurement }
    end
  end

<<<<<<< HEAD
=======
  # GET /measurements/new
  # GET /measurements/new.json
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
  def new
    @product = Product.find(params[:product_id])
    @measurement = @product.measurements.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @measurement }
    end
  end

<<<<<<< HEAD
  def create
    @product = Product.find(params[:product_id])    
    @measurements = @product.measurements.order(:position)
    
=======
  # GET /measurements/1/edit
  def edit
    @measurement = Measurement.find(params[:id])
    #@product = @measurement.product
  end

  # POST /measurements
  # POST /measurements.json
  def create
    @product = Product.find(params[:product_id])    
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
    @measurement = @product.measurements.build(params[:measurement])

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to product_measurements_path(@product), notice: 'Measurement was successfully created.' }
        format.json { render json: @measurement, status: :created, location: @measurement }
      else
<<<<<<< HEAD
        format.html { render action: "index" }
        #format.html { render action: "new" }
=======
        format.html { render action: "new" }
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD



  def edit
    @measurement = Measurement.find(params[:id])
  end

  def update
    @measurement = Measurement.find(params[:id])
    respond_to do |format|
      if @measurement.update_attributes(params[:measurement])
        format.html { redirect_to product_measurements_path(@measurement.product), notice: 'Measurement was successfully updated.' }
=======
  # PUT /measurements/1
  # PUT /measurements/1.json
  def update
    @measurement = Measurement.find(params[:id])
    @product = @measurement.product

    respond_to do |format|
      if @measurement.update_attributes(params[:measurement])
        format.html { redirect_to product_measurements_path(@product), notice: 'Measurement was successfully updated.' }
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
=======
  # DELETE /measurements/1
  # DELETE /measurements/1.json
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
  def destroy
    @measurement = Measurement.find(params[:id])
    @product = @measurement.product
    @measurement.destroy

    respond_to do |format|
      format.html { redirect_to product_measurements_path(@product) }
      format.json { head :ok }
    end
  end
<<<<<<< HEAD
    
  
  def sort
    params[:MeasurementsOrder].each_with_index do |id, index|
      Measurement.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
    end
    render :nothing => true
  end
  
  
=======
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
end
