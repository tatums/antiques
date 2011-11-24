class Keyword < ActiveRecord::Base
  belongs_to :product, :touch => true
  after_save :create_associated_product_index
  after_destroy :destroy_associated_product_index
  
  validates :title, :presence => true
  
  # def split_sentence_and_save_each_word_as_a_keyword(sentence, product)
  #   words = sentence.split(" ")
  #   words.each do |word|
  #     keyword = product.keyword.build
  #     keyword.title = word
  #     keyword.save
  #   end  
  # end  
  
  private
  def create_associated_product_index
    product.index!
  end
  
  def destroy_associated_product_index
    product.index!
  end
  
end
