require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
 
    describe '配送先情報の保存' do
      before do
        @order_address = FactoryBot.build(:order_address)
      end
  
      context '内容に問題ない場合' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_address).to be_valid
        end
        it 'Building name は空でも保存できること' do
          @order_address.building_name = ''
          expect(@order_address).to be_valid
        end
      end
  
      context '内容に問題がある場合' do
        it 'post codeが空だと保存できないこと' do
          @order_address.post_code = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post code can't be blank")
        end
      
        it 'post code が「3桁ハイフン4桁」の半角の半角文字列を含んだ正しい形式でないと保存できないこと' do
          @order_address.post_code = '1234567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
        end
  
        it '全角文字を含post codeでは登録できない' do
          @order_address.post_code  = '2１１1'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
        end
  
        it 'item_shipping_area_id が空では登録できない' do
          @order_address.item_shipping_area_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item shipping area can't be blank")
        end
  
        it '発送元の地域に「---」が選択されている場合は出品できない' do
          @order_address.item_shipping_area_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item shipping area can't be blank")
        end
  
       it 'cityは空では保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
  
        it 'blockは空では保存できないこと' do
        @order_address.block = ''
        @order_address.valid?
         expect(@order_address.errors.full_messages).to include("Block can't be blank")
         end
  
        it 'phone number は空では保存できないこと' do
          @order_address.phone_no = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone no can't be blank")
        end
  
        it 'phone number は10桁以下では保存できないこと' do
          @order_address.phone_no = '0808010'
          @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone no is too short")
        end
        
        
        it 'phone numberは10桁以上11桁以内の半角数値の正しい形式でないと保存できないこと' do
          @order_address.phone_no = '080−8010-4013'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone no is invalid. Input only number")
        end
  
        it 'userが紐付いていないと保存できないこと' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
      
        it 'itemが紐付いていないと保存できないこと' do
         @order_address.item_id = nil
         @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end

 
       it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        
      end
    end
  end
