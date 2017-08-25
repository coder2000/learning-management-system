# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer
  storage :file
  # storage :fog

  version :thumb do
    process thumbnail: [{ format: 'png', quality: 10, size: 598,
                          logger: Rails.logger }]
    def full_filename(for_file)
      png_name for_file, version_name
    end
  end

  def png_name(for_file, version_name)
    %(#{version_name}_#{for_file.chomp(File.extname(for_file))}.png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w[mp4 ogg flv]
  end
end
