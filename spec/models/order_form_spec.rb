require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 2
    @order = FactoryBot.build(:orderForm, user_id: user.id, item_id: item.id)
  end
  describe '商品購入' do

    context '商品購入がうまくいくとき' do
      it "全必須項目が正しく入力されているとき購入できる" do
        sleep 2
        expect(@order).to be_valid
      end
      it "建物名が空のときでも購入できる" do
        @order.building = ""
      end

    end

    context '商品購入がうまくいかないとき' do

      it "郵便番号が空のときは購入できない" do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "都道府県が空のときは購入できない" do
        @order.prefectures_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を入力してください")
      end
      it "市区町村が空のときは購入できない" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end
      it "番地が空のときは購入できない" do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it "電話番号が空のときは購入できない" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it "郵便番号のハイフンを記述しないと購入できない" do
        @order.postal_code = "0000000"
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は、'-'が必須です")
      end
      it "電話番号にハイフンがあると購入できない" do
        @order.phone_number = "123-4567-8901"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は、全て数値で入力してください。'-'不要です")
      end
      it "電話番号は11桁じゃないと購入できない" do
        @order.phone_number = "1234567890"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は、11桁で入力をお願いします")
      end
    end
  end
end
