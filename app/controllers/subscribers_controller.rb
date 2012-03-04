class SubscribersController < ApplicationController
  before_filter :require_user, :except => [:new, :create]

  def index
    @subscribers = Subscriber.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subscribers }
    end
  end


  def show
    @subscriber = Subscriber.find(params[:id])
    @note = "*WARNING* All assoicated Invoices will also be deleted and cannot be undone."

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subscriber }
    end
  end


  def new
    @subscriber = Subscriber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subscriber }
    end
  end


  def edit
    @subscriber = Subscriber.find(params[:id])
  end


  def create
    @subscriber = Subscriber.new(params[:subscriber])

    respond_to do |format|
      if @subscriber.save
        SubscriberMailer.subscribe(@subscriber).deliver
        format.html { redirect_to thank_you_path, notice: 'Subscriber was successfully saved.' }
        format.json { render json: @subscriber, status: :created, location: @subscriber }
      else
        format.html { render action: "new" }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @subscriber = Subscriber.find(params[:id])

    respond_to do |format|
      if @subscriber.update_attributes(params[:subscriber])
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy

    respond_to do |format|
      format.html { redirect_to subscribers_url }
      format.json { head :ok }
    end
  end
end
