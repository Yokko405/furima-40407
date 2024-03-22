require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user) # FactoryBotでUserインスタンスを生成
    @item = FactoryBot.create(:item) # Itemのインスタンスを生成
    @order = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id, token: "tok_abcdefghijk00000000000000000")
  end

  context '内容に問題ない場合' do
    it "tokenがあれば保存ができること" do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'userが紐づいていないと保存でいない' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐づいていないと保存でいない' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it "postal_codeが空では保存ができないこと" do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it "prefecture_idが空では保存ができないこと" do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "cityが空では保存ができないこと" do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it "address_numberが空では保存ができないこと" do
      @order.address_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address number can't be blank")
    end
    it "phone_numberが空では保存ができないこと" do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it "tokenが空では保存ができないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
