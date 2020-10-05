require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  
  describe '商品出品'do
  
    context '商品出品がうまくいくとき' do

      it "全ての値が存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "priceの範囲が300円以上9999999円以下だと登録できる" do
        @item.price = "500"
        @item.valid?
      end
      it "priceが半角数字だと登録できる" do
        @item.price = "500"
        @item.valid?
      end
    end


    context '商品出品がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "naemが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("名前を入力してください")
      end
      it "textが空だと登録できない" do
        @item.text =  nil
        @item.valid?
        expect(@item.errors.full_messages).to include("テキストを入力してください")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは数値で入力してください")
      end
      it "product_status_idが空だと登録できない" do
        @item.product_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は数値で入力してください")
      end
      it "presence_of_shipping_idが空だと登録できない" do
        @item.presence_of_shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は数値で入力してください")
      end
      it "shipping_origin_idが空だと登録できない" do
        @item.shipping_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は数値で入力してください")
      end
      it "date_of_shipment_idが空だと登録できない" do
        @item.date_of_shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は数値で入力してください")
      end
      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください")
      end
      it "priceの範囲が299円以下では登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は300以上の値にしてください")
      end
      it "priceの範囲が10,000,000円以上だと登録できない" do
        @item.price = "10,000,000"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は数値で入力してください")
      end
      it "category_idに1が選択された場合は登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it "product_status_idに1が選択された場合は登録できない" do
        @item.product_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it "presence_of_shipping_idに1が選択された場合は登録できない" do
        @item.presence_of_shipping_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it "shipping_origin_idに1が選択された場合は登録できない" do
        @item.shipping_origin_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end
      it "date_of_shipment_idに1が選択された場合は登録できない" do
        @item.date_of_shipment_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
    end
  end
end
