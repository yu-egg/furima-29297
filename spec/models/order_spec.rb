require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品購入' do

    context '商品購入がうまくいくとき' do
      it "全必須項目が正しく入力されているとき購入できる" do
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do

      it "郵便番号が空のときは購入できない" do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "都道府県が空のときは購入できない" do
        @order.prefectures_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefectures can't be blank")
      end
      it "市区町村が空のときは購入できない" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空のときは購入できない" do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空のときは購入できない" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "郵便番号のハイフンを記述しないと購入できない" do
        @order.postal_code = "0000000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Input '-'")
      end
      it "電話番号にハイフンがあると購入できない" do
        @order.phone_number = "123-4567-8901"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. Input all number")
      end
    end
  end
end
