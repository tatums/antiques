#MAIL = YAML.load_file("#{Rails.root}/config/mail.yml")



# if Rails.env.staging?
#   MAIL = { "staging" => { "send_to"=>"tatum@ashlandstudios.com",
#                           "send_as"=>"do_not_reply@phoebeboothantiques.com",
#                           "domain"=> ENV["MAIL_DOMAIN"] ,
#                           "user_name"=>  ENV['MAIL_USERNAME'] ,
#                           "password"=> ENV['MAIL_PASSWORD'] }  }
# end
