class AdminController < ApplicationController
  before_filter :require_user
  respond_to :html

  def test_mail
  end

  def send_test_mail
    @email = params[:email]
    TestMailer.send_test_email(@email).deliver
    redirect_to test_mail_path, notice: "Sent"
  end

end
