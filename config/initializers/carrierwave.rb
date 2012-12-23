CarrierWave.configure do |config|
  #config.grid_fs_access_url = "/stage/images"
  #if Rails.env.is_staging?
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: Figaro.env.aws_access_key_id,
      aws_secret_access_key: Figaro.env.aws_secret_access_key
    }
    config.fog_directory = Figaro.env.s3_bucket_name
  #end

end
