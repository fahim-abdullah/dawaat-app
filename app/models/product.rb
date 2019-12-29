class Product < ApplicationRecord
  before_save :set_old_price

  mount_uploader :available_image, ImageUploader
  mount_uploader :soldout_image, ImageUploader

  validates :name, uniqueness: { scope: :delivery_point,
    message: 'has already been taken in this delivery point' }

  validates :old_price, numericality: { allow_nil: true }
  validates :price, numericality: { greater_than: 0 }

  belongs_to :delivery_point

  private

  def set_old_price
    self.old_price = 0 if self.old_price == '' || self.old_price == nil
  end
end
