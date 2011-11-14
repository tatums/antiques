class ContactMailer < ActionMailer::Base
  default from: "admin@phoebeboothantiques.com"
  
  def contact_me(contact)
      @contact = contact
      @url  = "http://phoebeboothantiques.com"
      mail(:to => "phoebe@phoebeboothantiques.com", :subject => "Contact me")
  end
  
end
