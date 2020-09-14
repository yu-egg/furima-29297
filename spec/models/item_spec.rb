require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  
  describe '商品出品'do
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
        # expect(@item.errors.full_messages).to include("Presence of sipping can't be blank")
      end
      it "shipping_origin_idが空だと登録できない" do
        @item.shipping_origin_id = nil
        @item.valid?
        # expect(@item.errors.full_messages).to include("Sipping origin can't be blank")
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
      it "priceの範囲が300円以上9999999円以下でないと登録できない" do
        @item.price = [greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999]
        @item.valid?
        # expect(@item.errors.full_messages).to include("It can't be price")
      end
      it "priceが半角数字でないと登録できない" do
        @item.price = "/\d/"
        @item.valid?
        # expect(@item.errors.full_messages).to include("Price is all number")
      end
    end
  end
end
