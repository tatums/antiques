class Contact < ActiveRecord::Base
  include PgSearch

  attr_accessible :first, :last, :email, :address, :city, :state, :zip, :phone, :country, :note, :group_ids

  pg_search_scope :search,
    against: {first:    'A',
              last:     'A',
              email:    'B',
              address:  'B',
              city:     'B',
              state:    'B',
              zip:      'B'},
    associated_against: { groups: :title },
    using: { tsearch: { prefix: true} }


  validates_presence_of :first
  validates_associated :contact_groups



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
