class ShippingAddress < ApplicationRecord
  belongs_to :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :prefecture_id, presence: true

  validates :postal_code, presence: true
  validates :city, presence: true
  validates :address_number, presence: true
  validates :phone_number, presence: true

end
