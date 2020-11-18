require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  describe '商品購入が完了できる' do
    before do
      @address_purchase = FactoryBot.build(:address_purchase)
    end

   context '新規登録が成功する場合' do
      it '商品購入フォームに正しい情報が存在すれば購入できる' do
        expect(@address_purchase).to be_valid
      end

      it 'building_nameが空でも購入できる' do
        @address_purchase.building_name = nil
        expect(@address_purchase).to be_valid
      end
   end

   context '新規登録に失敗する場合' do

      it 'tokenが空では購入できない' do
        @address_purchase.token = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では購入できない' do
        @address_purchase.postal_code = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが含まれていないと購入できない' do
        @address_purchase.postal_code = '1111111'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include('Postal code ハイフンを入れて入力してください')
      end

      it 'prefectures_idが空では購入できない' do
        @address_purchase.prefectures_id = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Prefectures can't be blank")
      end

      it 'prefectures_idが1の場合購入できない' do
        @address_purchase.prefectures_id = 1
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include('Prefectures --は選択できません')
      end

      it 'phone_numberが空では購入できない' do
        @address_purchase.phone_number = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上だと購入できない' do
        @address_purchase.phone_number = '080111122223'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include('Phone number 数字のみで11文字以内で入力してください')
      end

      it 'phone_numberにハイフンが入っていると購入できない' do
        @address_purchase.phone_number = '080-000-000'
        @address_purchase.valid?
        binding.pry
        expect(@address_purchase.errors.full_messages).to include('Phone number 数字のみで11文字以内で入力してください')
      end

      it 'cityが空だと購入できない' do
        @address_purchase.city = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと購入できない' do
        @address_purchase.address = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Address can't be blank")
      end

      it 'user_idが空だと購入できない' do
        @address_purchase.user_id = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @address_purchase.item_id = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
