module CategoriesHelper

  PREVIEW_WORDS = 60

  def capitalize_title(category)
    category.title.split(" ").each{|word| word.capitalize!}.join(" ")
  end

  def upcase_title(category)
    category.title.split(" ").each{|word| word.upcase!}.join(" ")
  end

  def read_more(product, preview = "")
    if product.body
      product.body.truncate(PREVIEW_WORDS)
    end
  end

end
