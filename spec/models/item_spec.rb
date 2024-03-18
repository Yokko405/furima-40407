require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user) # FactoryBotでUserインスタンスを生成
    @item = FactoryBot.build(:item, user: @user) # Itemのインスタンスを生成
  end

  describe '商品の保存' do
    context '商品が保存できる場合' do
      it '必要な情報が全て存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が保存できない場合' do
      it '商品画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品名が40文字を超えると保存できない' do
        @item.name = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end

      it '商品説明がないと保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '商品説明が1000文字を超えると保存できない' do
        @item.description = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      
      it 'カテゴリーIDがないと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態のIDがないと保存できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料負担のIDがないと保存できない' do
        @item.shipping_fee_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee payer can't be blank")
      end

      it '発送元地域のIDがないと保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送日数のIDがないと保存できない' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格がないと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が9,999,999より大きいと保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格が半角数値以外だと保存できない' do
        @item.price = "３３３３"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
  end














end
