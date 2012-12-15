CarrierWave.configure do |config|
  #config.grid_fs_access_url = "/stage/images"
  if Rails.env.is_staging?
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    }
    config.fog_directory = ENV["AWS_S3_BUCKET"]
  end

end
