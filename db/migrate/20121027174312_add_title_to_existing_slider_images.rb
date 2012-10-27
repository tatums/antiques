class AddTitleToExistingSliderImages < ActiveRecord::Migration
  def up
    #In the slider model is a default title.
    #this will save all the slider images and
    #set the default title.
    Slider.all.each{ |s| s.save }
  end

  def down

  end
end
