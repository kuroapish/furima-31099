require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品の投稿' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品が成功する' do

      it '全ての項目が正しく入力されていれば成功する' do
        expect(@item).to be_valid
      end
    end

    context '商品投稿に失敗する場合' do

      it '商品の画像を載せていないと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空欄では投稿できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品名が40字以上だと投稿できない' do
        @item.name = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end

      it '商品の説明蘭が空欄では投稿できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '商品の説明が1000字以上だと投稿できない' do
        @item.description = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end

      it '商品カテゴリーが選択されていないと投稿できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品カテゴリーidが１では投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態が選択されていないと投稿できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品の状態のidが１では投稿できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担が選択されていないと投稿できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it '配送料の負担のidが１では投稿できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it '発送元の地域が選択されていないと投稿できない' do
        @item.ship_form_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship form can't be blank")
      end

      it '発送元の地域のidが１では投稿できない' do
        @item.ship_form_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship form must be other than 1")
      end

      it '発送までの日数が選択されていないと投稿できない' do
        @item.days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end

      it '発送までの日数のidが１では投稿できない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end

      it '販売価格が入力されていないと投稿できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が300円以上、9,999,999円以下でないと投稿できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300円〜9,999,999円の間で入力してください")
      end

      it '販売価格が半角数字以外では投稿できない' do
        @item.price = "６０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で入力してください")
      end
    end
  end
end