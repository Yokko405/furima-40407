require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ユーザー登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = '' # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = '' # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailが重複していると登録できない' do
        anotheruser = FactoryBot.create(:user)
        @user.email = anotheruser.email
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'passwordが空では登録できない' do
        @user.password = '' # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordとpassword_confirmationが一致しない場合は登録できない' do
        @user.password = 'PASSWORD1' # passwordを設定する
        @user.password_confirmation = 'PASSWORD2' # passwordと違うpassword_confirmationを設定する
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空では登録できない' do
        @user = FactoryBot.build(:user) # Userのインスタンス生成
        @user.last_name = '' # last_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = '' # first_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = '' # kana_last_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana last name can't be blank"
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = '' # kana_first_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = '' # birthdayの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
