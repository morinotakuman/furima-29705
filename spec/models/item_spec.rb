require 'rails_helper'
describe User do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it "image,name,description,categories_id,state_id,bearer_id,area_id,days_id,priceが入力されていれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品機能がうまくいかないとき' do
      it 'imageが空の時は出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Imageを入力してください")
      end
      it 'nameが空の時は出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Nameを入力してください")
      end
      it 'descriptionが空の時は出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Descriptionを入力してください")
      end
      it 'categories_idが1の時は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoriesは1以外の値にしてください")
      end
      it 'state_idが1の時は出品ができない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Stateは1以外の値にしてください")
      end
      it 'bearer_idが1の時は出品ができない' do
        @item.bearer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Bearerは1以外の値にしてください")
      end
      it 'area_idが1の時は出品ができない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Areaは1以外の値にしてください")
      end
      it 'days_idが1の時は出品ができない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Daysは1以外の値にしてください")
      end
      it 'priceが空の時は出品ができない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceを入力してください")
      end
      it 'priceは¥300以下だと出品ができない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは一覧にありません")
      end
      it 'priceは¥9999999以上だと出品ができない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは一覧にありません")
      end
      it 'priceは半角数字しか保存ができない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end
    end
  end
end