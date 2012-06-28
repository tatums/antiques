class Contact < ActiveRecord::Base
  validates_presence_of :first
  #validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  has_many :invoices, :dependent => :destroy
  has_many :contact_groups
  has_many :groups, :through => :contact_groups

  scope :excluding_ids, lambda { |ids|
    where(['id NOT IN (?)', ids]) if ids.any?
  }

  def full_name
    first.to_s + " " + last.to_s
  end

  def name_and_address
    first.to_s + " " + last.to_s + " <br />" + address.to_s + " <br />" + city.to_s + ", " + state.to_s + " " + zip.to_s
  end
  def city_state_zip
    city.to_s + ", " + state.to_s + " " + zip.to_s
  end

  searchable :auto_index => true, :auto_remove => true do
    text :first, :last, :email
  end



  STATE_SELECT = [
    # Displayed,Stored in DB
    ['AL','AL'] ,
    ['AK','AK'] ,
    ['AZ','AZ'] ,
    ['AR','AR'] ,
    ['CA','CA'] ,
    ['CO','CO'] ,
    ['CT','CT'] ,
    ['DE','DE'] ,
    ['DC','DC'] ,
    ['FL','FL'] ,
    ['GA','GA'] ,
    ['HI','HI'] ,
    ['ID','ID'] ,
    ['IL','IL'] ,
    ['IN','IN'] ,
    ['IA','IA'] ,
    ['KS','KS'] ,
    ['KY','KY'] ,
    ['LA','LA'] ,
    ['ME','ME'] ,
    ['MD','MD'] ,
    ['MA','MA'] ,
    ['MI','MI'] ,
    ['MN','MN'] ,
    ['MS','MS'] ,
    ['MO','MO'] ,
    ['MT','MT'] ,
    ['NE','NE'] ,
    ['NV','NV'] ,
    ['NH','NH'] ,
    ['NJ','NJ'] ,
    ['NM','NM'] ,
    ['NY','NY'] ,
    ['NC','NC'] ,
    ['ND','ND'] ,
    ['OH','OH'] ,
    ['OK','OK'] ,
    ['OR','OR'] ,
    ['PA','PA'] ,
    ['RI','RI'] ,
    ['SC','SC'] ,
    ['SD','SD'] ,
    ['TN','TN'] ,
    ['TX','TX'] ,
    ['UT','UT'] ,
    ['VT','VT'] ,
    ['VA','VA'] ,
    ['WA','WA'] ,
    ['WV','WV'] ,
    ['WI','WI'] ,
    ['WY','WY'] ]
end
