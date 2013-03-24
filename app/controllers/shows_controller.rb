class ShowsController < ApplicationController
  respond_to :html, :js
  before_filter :require_user, :except => [:index]

  include Sort

  def index
    @shows = Show.order(:position)
    @show= Show.new
    respond_with(@shows)
  end


  def create
    @show = Show.new(params[:show])
    @show.save
    respond_with(@shows, location: shows_path)
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


end
