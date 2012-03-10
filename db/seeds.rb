# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.delete_all
Category.create(title: 'CABINET FURNITURE')
Category.create(title: 'COFFEE TABLES')
Category.create(title: 'FINE ART & SCULPTURE')
Category.create(title: 'FIRE WARES')
Category.create(title: 'LIGHTING')
Category.create(title: 'MIRRORS')
Category.create(title: 'SEATING')
Category.create(title: 'TABLES AND DESKS')
Category.create(title: 'VARIOUS')

categories = Category.all

categories.each do |c|
  c.update_attributes(:active => 'true')
  puts "Created Category #{c.title}"
end

u = User.create!({:email => "tatum@ashlandstudios.com", :password => "pa88word", :password_confirmation => "pa88word" })
u = User.create!({:email => "admin@example.com", :password => "password", :password_confirmation => "password" })

puts "Created User #{u.email}"
