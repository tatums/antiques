class EmailsController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]

  def index
    @emails = Email.page params[:page]
  end

  def show
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(params[:email])

    respond_to do |format|
      if @email.save
        ContactMailer.subscribe(@email).deliver
        format.html { redirect_to thank_you_path, notice: 'Email was successfully saved.' }
        format.json { render json: @email, status: :created, location: @email }
      else
        format.html { render action: "new" }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
    
  end

end
