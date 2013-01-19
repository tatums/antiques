class Image < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  #validates_presence_of :image
  attr_accessible :image, :photo_file
  belongs_to :product
  mount_uploader :image, ImageUploader

  def to_jq_upload
      {
        "name" => read_attribute(:image),
        "size" => image.size,
        "url" => image.url,
        "thumbnail_url" => image_url,
        "delete_url" => image_path(:id => id),
        "delete_type" => "DELETE"
      }
  end

end
