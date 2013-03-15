class Contact < ActiveRecord::Base
  attr_accessible :first, :last, :email, :address, :city, :state, :zip, :phone, :country, :note

  validates_presence_of :first
  #validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  has_many :invoices, :dependent => :destroy
  has_many :contact_groups
  has_many :groups, :through => :contact_groups
  has_many :notes, :as => :notable

  scope :excluding_ids, lambda { |ids|
    where(['id NOT IN (?)', ids]) if ids.any?
  }

  def self.find_records(query=nil)
    if query
      Contact.search {keywords query}.results
    else
      Contact.all
    end
  end

  def full_name
    first.to_s + " " + last.to_s
  end

  def name_and_address
    first.to_s + " " + last.to_s + " <br />" + address.to_s + " <br />" + city.to_s + ", " + state.to_s + " " + zip.to_s
  end
  def city_state_zip
    city.to_s + ", " + state.to_s + " " + zip.to_s
  end


end
