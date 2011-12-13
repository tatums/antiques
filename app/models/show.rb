class Show < ActiveRecord::Base
  
  validates :title, :presence => true
  #validates :url => :must_be_valid_url
  
  scope :active, where(:active => true)
  after_initialize :set_active


  def must_be_valid_url
    if (url =~ URI::regexp).nil?   
      url.errors.add "Not a valid URL.. Make sure to include HTTP http://example.site.com"
    end
  end


private

  def set_active
    self.active  ||= true          #will set the default value only if it's nil
  end

  # def init
  #   self.number  ||= 0.0           #will set the default value only if it's nil
  #   self.address ||= build_address #let's you set a default association
  # end
end
