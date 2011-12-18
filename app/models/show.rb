class Show < ActiveRecord::Base

  after_create 
  validates :title, :presence => true
  
  scope :active, where(:active => true)
  before_save :set_active, :set_init_position 

  def must_be_valid_url
    if (url =~ URI::regexp).nil?   
      url.errors.add "Not a valid URL.. Make sure to include HTTP http://example.site.com"
    end
  end



private

  def set_active
    self.active  ||= true          #will set the default value only if it's nil
  end

  def set_init_position
    self.position = Show.active.size
  end

  # def init
  #   self.number  ||= 0.0           #will set the default value only if it's nil
  #   self.address ||= build_address #let's you set a default association
  # end
end
