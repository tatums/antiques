namespace :phoebeboothantiques do

  desc "Insert Default Shows."
  task :setup_initial_shows => :environment do
    Show.create(:active => true, :title => "The Antiques and Garden Show of Nashville", 
                :dates  => "February 10-12, 2012", :url => "http://www.antiquesandgardenshow.com/")
    Show.create(:active => true, :title => "Maryland Antiques Show of Hunt Valley", 
                :dates  => "February 23-26, 2012", :url => "http://huntvalleyantiquesshow.org/")
    Show.create(:active => true, :title => "Chicago Botanic Garden Antiques and Garden Fair", 
                :dates  => "April 20-22, 2012", :url => "http://www.stellashows.com/cgi-bin/texis/scripts/showpromo_info/stellashowdetail.html?idnum=ZJD1463&showabb=botanic20020419")
    Show.create(:active => true, :title => "Shaia Nantucket Antiques Show", 
                :dates  => "August 10-13, 2012", :url => "")            
  end

end