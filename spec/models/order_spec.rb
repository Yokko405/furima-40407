require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user) # FactoryBotでUserインスタンスを生成
    @item = FactoryBot.build(:item, user: @user) # Itemのインスタンスを生成
    @order = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  
  end

  context '内容に問題ない場合' do
    
    it "必須データがそろっていれば保存ができること" do
      item = FactoryBot.create(:item, user: @user) # このテストのみcreateを使用
      order = FactoryBot.build(:order_form, user_id: @user.id, item_id: item.id)
      expect(order).to be_valid
    end

    it "building_nameが空でも保存ができること" do
      item = FactoryBot.create(:item, user: @user) # このテストのみcreateを使用
      order = FactoryBot.build(:order_form, user_id: @user.id, item_id: item.id)
      order.building_name = nil
      expect(order).to be_valid
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

    it "postal_codeが3桁-4桁じゃないと保存ができないこと" do
      @order.postal_code = "12-123"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
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

    it "phone_numberが9桁以下では保存ができないこと" do
      @order.phone_number = "123456789"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberが12桁以上では保存ができないこと" do
      @order.phone_number = "123456789012"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end

    it "tokenが空では保存ができないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
