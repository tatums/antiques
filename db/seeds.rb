# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.delete_all
Category.create(title: 'Case Furniture', description: 'Items intended primarily as receptacles -  for example, chests or drawers.')
Category.create(title: 'Fine Art & Sculpture', description: 'Fine art or the fine arts encompass art forms developed primarily 
      for aesthetics and/or concept rather than practical application. Art is often a synonym for fine art, as employed in the 
      term /"art gallery/".')
Category.create(title: 'Lighting', description: 'Equipment in a home, workplace, studio, theater, or street for producing light.')
Category.create(title: 'Mirrors', description: 'A reflective surface, glass coated with a metal amalgam, that reflects a clear image.')
Category.create(title: 'Tables', description: 'An article of furniture supported by one or more vertical legs and having a flat horizontal surface.')
Category.create(title: 'Other', description: 'Everything else.')


c = Category.first
c.update_attributes(:active => 'true')

categories = Category.all

categories.each do |c|
  puts "Created Category #{c.title}"
end

