require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入したuserとその商品' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      sleep 0.5
      @order_address = FactoryBot.build(:order_address,user_id: @user.id , item_id: @item.id)
     end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
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
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空である' do
        @order_address.item_id = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'postal_codeが空である' do
        @order_address.postal_code = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は不正な値です")
      end
      it 'shipment_idが空である' do
        @order_address.shipment_id = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください", "都道府県は数値で入力してください")
      end
      it 'municipalityが空である' do
        @order_address.municipality = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空である' do
        @order_address.address = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空である' do
        @order_address.phone_number = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は不正な値です")
      end
      it 'postal_codeにハイフンが含まれていない' do
        @order_address.postal_code = '1111111 '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'postal_codeの文字数が足りない' do
        @order_address.postal_code = '11-111 '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'shipment_idが未選択になっている' do
        @order_address.shipment_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it 'phone_numberの文字数が足りない' do
        @order_address.phone_number = '111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it "英数混合では登録できないこと" do
      @order_address.phone_number = '1a1a1a1a1a1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end