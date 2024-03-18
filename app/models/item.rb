class Item < ApplicationRecord
  belongs_to :users
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  validates :name, presence: true
  validates :descripation, presence: true
  validates :price, presence: true
end
