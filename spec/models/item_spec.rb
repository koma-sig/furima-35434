require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    
    describe '商品出品情報の保存' do
      context '商品出品情報ができる場合' do
        it '全ての必須項目及び販売価格は、¥300~¥9,999,999の間のみ保存可能でかつ半角数字のみ、入力された販売価格によって、販売手数料や販売利益の表示が変わる' do
          @item = FactoryBot.build(:item)
          expect(@item).to be_valid
        end
      end
      context '商品出品情報ができない場合' do
        it '商品画像が空になっている' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("出品画像を入力してください")
        end
        it '商品名が空になっている' do
          @item.product = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("商品名を入力してください")
        end
        it '商品の説明が空になっている' do
          @item.product_description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("商品の説明を入力してください")
        end
        it 'カテゴリーの情報が空になっている' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("カテゴリーは数値で入力してください", "カテゴリーを入力してください")
        end
        it '商品の状態についての情報が空になっている' do
          @item.product_status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("商品の状態は数値で入力してください", "商品の状態を入力してください")
        end
        it '配送料の負担についての情報が空になっている' do
          @item.delivery_charge_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("配送料の負担は数値で入力してください", "配送料の負担を入力してください")
        end
        it '発送元の地域についての情報が空になっている' do
          @item.shipment_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("発送元の地域は数値で入力してください", "発送元の地域を入力してください")
        end
        it '発送までの日数についての情報が空になっている' do
          @item.shipping_days_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("発送までの日数は数値で入力してください", "発送までの日数を入力してください")
        end
        it '販売価格についての情報が空になっている' do
          @item.price =''
          @item.valid?
          expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格は数値で入力してください")
        end
        it 'category_idが未選択のidになっている' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
        end
        it 'product_status_idが未選択のidになっている' do
          @item.product_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
        end
        it 'delivery_charge_idが未選択のidになっている' do
          @item.delivery_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
        end
        it 'shipment_idが未選択のidになっている' do
          @item.shipment_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
        end
        it 'shipping_days_idが未選択のidになっている' do
          @item.shipping_days_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
        end
        it '配送料の負担についての情報が下回っている' do
          @item.price = 200
          @item.valid?
          expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
        end
        it '配送料の負担についての情報が上回っている' do
          @item.price = 1000000000
          @item.valid?
          expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
        end
        it '配送料の負担についての情報が全角数字では出品できない' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
        end
      end
    end
  end
end