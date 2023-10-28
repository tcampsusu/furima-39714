require 'rails_helper'



RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)

  end

  describe '出品機能' do
    context '出品できる場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'imageは空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end


      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'item_category_id が空では登録できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it 'item_condition_id が空では登録できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it 'item_shipping_fee_status_id が空では登録できない' do
        @item.item_shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end

      it 'item_shipping_area_id が空では登録できない' do
        @item.item_shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping area can't be blank")
      end

      it 'item_shipping_time_id が空では登録できない' do
        @item.item_shipping_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping time can't be blank")
      end

      it 'item_price が空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it 'item_price が300以下では登録できない' do
        @item.item_price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end

      it 'item_price が300以下では登録できない' do
        @item.item_price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end

      it 'item_priceが9999999以上では登録できない' do
        @item.item_price = '999999999'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end

      it '全角文字を含item_priceでは登録できない' do
        @item.item_price  = '2１１1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end
end