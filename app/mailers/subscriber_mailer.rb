class SubscriberMailer < ActionMailer::Base
  default from: ENV["send_as"]

  def subscribe(contact)
      @contact = contact
      @url  = "http://phoebeboothantiques.com"
      mail(:to => ENV["send_to"], :subject => "Subscriber")
  end
end
