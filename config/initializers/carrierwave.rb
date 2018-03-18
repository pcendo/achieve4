module CarrierWave
  module MiniMagick
    def fix_exif_rotation
      manipulate! do |img|
        img.auto_orient
        img = yield(img) if block_given?
        img
      end
    end
  end
end

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV["AWS_S3_KEY_ID"],
    :aws_secret_access_key  => ENV["AWS_S3_SECRET_KEY"],
    :region                 => 'ap-northeast-1'
  }
  config.fog_directory  = ENV["AWS_S3_BUCKET"]
end