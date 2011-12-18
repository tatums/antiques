class ShowsController < ApplicationController
  before_filter :require_user, :except => [:index]

  def index
    @shows = Show.active.order(:position)
    @show= Show.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shows }
    end
  end


  def create
    @show = Show.new(params[:show])

    respond_to do |format|
      if @show.save
        format.html { redirect_to shows_path, notice: 'Show was successfully created.' }
        format.js
        format.json { render json: @show, status: :created, location: @show }
      else
        format.html { render action: "new" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @show = Show.find(params[:id])
    @show.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to shows_url }
      format.json { head :ok }
    end
  end
  
  def sort
    params[:ShowsOrder].each_with_index do |id, index|
      Show.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
    end
    render :nothing => true
  end
  
  
end
