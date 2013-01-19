class Show < ActiveRecord::Base

  after_create
  validates :title, :presence => true

  scope :active, where(:active => true)
  before_save :set_init_position

  def must_be_valid_url
    if (url =~ URI::regexp).nil?
      url.errors.add "Not a valid URL.. Make sure to include HTTP http://example.site.com"
    end
  end

private

  def set_init_position
    self.position = Show.active.size
  end

end
