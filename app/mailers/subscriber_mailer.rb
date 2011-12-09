class SubscriberMailer < ActionMailer::Base
  default from: "admin@phoebeboothantiques.com"
    
  def subscribe(subscriber)
      @subscriber = subscriber
      @url  = "http://phoebeboothantiques.com"
      mail(:to => "tatum@ashlandstudios.com", :subject => "Subscription")
  end    
end
