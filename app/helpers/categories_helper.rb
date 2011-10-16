module CategoriesHelper

  def published(category)
    if category.active == true
      return "Yes"
    else
      return "No"
    end    
  end

  def capitalize_title(category)
    category.title.split(" ").each{|word| word.capitalize!}.join(" ")
  end  


end
