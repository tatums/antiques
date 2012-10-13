#MAIL = YAML.load_file("#{Rails.root}/config/mail.yml")
if Rails.env.staging?
  MAIL = { "staging" => { "send_to"=>"tatum@ashlandstudios.com",
                          "send_as"=>"do_not_reply@phoebeboothantiques.com",
                          "domain"=>"phoebeboothantiques.com",
                          "user_name"=>"admin@phoebeboothantiques.com",
                          "password"=>"password"  }   }

end
