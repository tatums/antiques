class ContactMailer < ActionMailer::Base
  default from: "admin@phoebeboothantiques.com"
  
  def contact_me(contact)
      @contact = contact
      @url  = "http://phoebeboothantiques.com"
      mail(:to => "tatum@ashlandstudios.com", :subject => "Contact me")
  end
  
  def subscribe(email)
      @email = email
      @url  = "http://phoebeboothantiques.com"
      mail(:to => "tatum@ashlandstudios.com", :subject => "Subscription")
  end    
end
