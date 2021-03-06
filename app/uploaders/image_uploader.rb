class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process resize_to_fit: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :jumbo do
    process resize_to_fill: [2000, 1125]
  end

  version :banner do
    process resize_to_fill: [1500, 200]
  end

  version :large do
    process resize_to_fill: [1280, 720]
  end

  version :medium do
    process resize_to_fill: [640, 360]
  end

  version :small do
    process resize_to_fill: [320, 180]
  end

  version :thumb do
    process resize_to_fill: [64, 36]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
