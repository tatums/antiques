class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:email].downcase.strip, params[:password])
      session[:user_id] = user.id
      redirect_back_or_default(root_url, "Logged in!")
    else
      flash.now[:alert] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
