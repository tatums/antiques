module CategoriesHelper

  def capitalize_title(category)
    category.title.split(" ").each{|word| word.capitalize!}.join(" ")
  end

  def upcase_title(category)
    category.title.split(" ").each{|word| word.upcase!}.join(" ")
  end

  def read_more(product)
    preview = ""
    unless product.body.blank?
      desc = product.body
      preview_words = 60
      total_words = desc.split.length
      if total_words < preview_words
        preview = desc
      else
        preview = desc.split[0..preview_words].join(" ")+" ... "
      end
    end
    return preview
  end

end
