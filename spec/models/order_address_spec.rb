require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入したuserとその商品' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        @order_address = FactoryBot.build(:order_address)
        expect(@order_address).to be_valid
      end
      it '建物番号は空でも登録できること'do
        @order_address.building_name = ' '
        expect(@order_address).to be_valid
      end
    end

    context '商品出品情報ができない場合' do
      it 'user_idが空である' do
        @order_address.user_id = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空である' do
        @order_address.item_id = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空である' do
        @order_address.postal_code = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'shipment_idが空である' do
        @order_address.shipment_id = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipment can't be blank", "Shipment is not a number")
      end
      it 'municipalityが空である' do
        @order_address.municipality = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空である' do
        @order_address.address = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空である' do
        @order_address.phone_number = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'postal_codeにハイフンが含まれていない' do
        @order_address.postal_code = '1111111 '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeの文字数が足りない' do
        @order_address.postal_code = '11-111 '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'shipment_idが未選択になっている' do
        @order_address.shipment_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipment must be other than 1")
      end
      it 'phone_numberの文字数が足りない' do
        @order_address.phone_number = '1111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "英数混合では登録できないこと" do
      @order_address.phone_number = '1a1a1a1a1a1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end