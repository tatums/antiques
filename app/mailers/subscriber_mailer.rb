class SubscriberMailer < ActionMailer::Base
  default from: MAIL[Rails.env]["send_as"]

  def subscribe(subscriber)
      @subscriber = subscriber
      @url  = "http://phoebeboothantiques.com"
      mail(:to => MAIL[Rails.env]["send_to"], :subject => "Subscription")
  end
end
