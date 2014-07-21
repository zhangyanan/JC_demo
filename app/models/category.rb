class Category < ActiveRecord::Base
    mount_uploader :cover, ImageUploader
end