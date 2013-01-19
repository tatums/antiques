class TestMailer < ActionMailer::Base
  default from: ENV["send_as"]

  def send_test_email(mail_address)
    mail(:to => mail_address, :subject => "Test Email")
  end
end
