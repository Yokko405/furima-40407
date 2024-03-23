class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      purchase_record = PurchaseRecord.create!(user_id:, item_id:)
      ShippingAddress.create!(purchase_record_id: purchase_record.id, postal_code:, prefecture_id:,
                              city:, address_number:, building_name:, phone_number:)
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end
