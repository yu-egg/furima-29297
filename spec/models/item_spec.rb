require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  
  describe '商品出品'do
  
  context '商品出品がうまくいくとき' do
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
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "naemが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空だと登録できない" do
        @item.text =  nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "product_status_idが空だと登録できない" do
        @item.product_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end
      it "presence_of_shipping_idが空だと登録できない" do
        @item.presence_of_shipping_id = nil
        @item.valid?
      end
      it "shipping_origin_idが空だと登録できない" do
        @item.shipping_origin_id = nil
        @item.valid?
      end
      it "date_of_shipment_idが空だと登録できない" do
        @item.date_of_shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Date of shipment can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceの範囲が299円以下では登録できない" do
        @item.price = "299"
        @item.valid?
      end
      it "priceの範囲が10,000,000円以上だと登録できない" do
        @item.price = "10,000,000"
        @item.valid?
      end
      it "category_idに1が選択された場合は登録できない" do
        @item.category_id = "1"
        @item.valid?
      end
      it "product_status_idに1が選択された場合は登録できない" do
        @item.product_status_id = "1"
        @item.valid?
      end
      it "presence_of_shipping_idに1が選択された場合は登録できない" do
        @item.presence_of_shipping_id = "1"
        @item.valid?
      end
      it "shipping_origin_idに1が選択された場合は登録できない" do
        @item.shipping_origin_id = "1"
        @item.valid?
      end
      it "date_of_shipment_idに1が選択された場合は登録できない" do
        @item.date_of_shipment_id = "1"
        @item.valid?
      end
    end
  end
end
