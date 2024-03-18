class Item < ApplicationRecord
  belongs_to :users
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  validates :name, presence: true
  validates :descripation, presence: true
  validates :price, presence: true

  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_payer_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true

end
