class Configuration < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :phone, :state, :zip, :email, :current
  validates :address1, :city, :phone, :state, :zip, :email, :presence => true
  validate :only_one_current
  before_destroy :protect_current

  def self.current
    find_by_current(true)
  end

  def activate
    Configuration.current.update_attributes(current:false)
    update_attributes(current:true)
  end

  def line_1
    [address1, address2].compact.join(', ')
  end

  def line_2
    [city, state, zip].compact.join(', ')
  end

  def company_name
    'PHOEBE BOOTH ANTIQUES LLC'
  end

  def footer
    "#{company_name} | #{line_1}, #{line_2} | #{phone}"
  end

  private

  def protect_current
    self.errors[:base] << "Sorry. You can NOT delete the current Configuration" and return false if self.current?
  end

  def only_one_current
    if current? and Configuration.current
      errors.add( :current, 'already has an current configuration')
    end
  end

end
