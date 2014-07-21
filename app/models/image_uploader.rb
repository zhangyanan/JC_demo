class ImageUploader < CarrierWave::Uploader::Base
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def default_url
  #  setting.upload_url 这个是你的图片空间 url
    "#{Setting.upload_url}/blank.png#{version_name}"
  end

#  覆盖url方法以适应”图片空间“的缩略图命名
  def url(version_name = "")
    @url ||= super({})
    return @url if version_name.blank?
    if not version_name.in?(IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES)
    #  故意在调用一个没有定义的"缩略图版本名称"的时候抛出异常，以便开发的时候能够及时找到错误
      raise "ImageUploader version_name:#{version_name} not allow"
    end
    #我这里在图片空间选用！作为"间隔标识符"
    [@url,version_name].join("!")
  end

  def extension_white_list
    if super.present?
      model.uploader_secure_toker ||= SecureRandom.uuid.gsub("-","")
      Rails.logger.debug("(BaseUploader.filename) #{model.uploader_secure_toker}")
      "#{model.uploader_secure_toker}.#{file.extension.downcase}"
    end
  end
end