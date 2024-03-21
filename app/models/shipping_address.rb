class ShippingAddress < ApplicationRecord
  attr_accessor :token

  belongs_to :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address_number, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
end
