class Product < ApplicationRecord
  mount_uploader :available_image, ImageUploader
  mount_uploader :soldout_image, ImageUploader

  belongs_to :delivery_point
end