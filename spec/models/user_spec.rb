require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーの新規登録を保存する' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録が成功する場合' do
      it '全ての項目が正しく存在すれば成功する' do
        expect(@user).to be_valid
      end
    end

    context '新規登録に失敗する場合' do
      it 'ニックネームが空欄では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空欄では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに＠が入っていないと登録できない' do
        @user.email = "tstecom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'ニックネームが空欄では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'パスワードが空欄では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以上でないと登録できない' do
        @user.password = "ab123"
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが半角英語のみでは登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字両方入れてください")
      end
      
      it 'passwordに半角の英語と数字が両方無いと登録できない' do
        @user.password = "123456"
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字両方入れてください")
      end


      it 'passwordとその再入力が同一ででないと登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = 'cccccc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが空欄では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空欄では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_name_kanaが空欄では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaが空欄では登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '生年月日が空欄では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'first_nameが全角でないと登録できない' do
        @user.first_name = "asha"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it 'last_nameが全角でないと登録できない' do
        @user.last_name = "asha"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end

      it 'first_name_kanaが全角カタカナでないと登録できない' do
        @user.first_name_kana = "佐藤"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end

      it 'last_name_kanaが全角カタカナでないと登録できない' do
        @user.last_name_kana = "二郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end
    end
  end
end