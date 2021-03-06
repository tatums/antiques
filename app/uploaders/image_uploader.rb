class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick


  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb_50 do
    process :resize_to_limit => [50, 50]
  end
  version :thumb_100 do
    process :resize_to_limit => [100, 100]
  end
  version :thumb_200 do
    process :resize_to_limit => [200, 200]
  end
  version :thumb_300 do
    process :resize_to_limit => [300, 300]
  end
  version :medium do
    process :resize_to_limit => [600, 600]
  end
  version :large do
    process :resize_to_limit => [1000, 1000]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(jpg jpeg gif png)
   end

#   #Recreate all the image versions
#   User.all.each do |user|
#     user.avatar.recreate_versions!
#   end



end
