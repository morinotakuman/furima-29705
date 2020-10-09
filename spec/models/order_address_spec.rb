require 'rails_helper'
describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "token, zip_code, prefecture, city, street_number, building_name, phone_numberが入力できていれば商品購入ができる" do
        expect(@order_address).to be_valid
      end
      it "building_nameが空でも商品購入できる" do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "tokenが空のとき商品購入できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tokenを入力してください")
      end
      it "zip_codeが空のとき商品購入できない" do
        @order_address.zip_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip codeを入力してください")
      end
      it "zip_codeにハイフンが含まれていない場合は商品購入できない" do
        @order_address.zip_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip codeは不正な値です")
      end
      it "prefectureが入力されていない場合は商品購入できない" do
        @order_address.prefecture = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectureは1以外の値にしてください")
      end
      it "cityが空のときは商品購入できない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Cityを入力してください")
      end
      it "street_numberが空のときは商品購入できない" do
        @order_address.street_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street numberを入力してください")
      end
      it "phone_numberが空のときは商品購入できない" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone numberを入力してください")
      end
      it "phone_numberが11桁以内でないと商品購入できない" do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone numberは不正な値です")
      end
    end
  end
end