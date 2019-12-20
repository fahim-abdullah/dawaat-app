class Product < ApplicationRecord
  before_save :set_old_price

  mount_uploader :available_image, ImageUploader
  mount_uploader :soldout_image, ImageUploader

  belongs_to :delivery_point

  private

  def set_old_price
    self.old_price = 0 if self.old_price == '' || self.old_price == nil
  end
end