require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報の入力がうまくいかない時' do
      it 'imageが空の場合' do
        @item.image = 
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空の場合' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_informationが空の場合' do
        @item.item_information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item information can't be blank")
      end
      it 'priceが空の場合' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'categoryが空の場合' do
        @item.category_id = 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_conditionが空の場合' do
        @item.item_condition_id = 
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'postage_payerが空の場合' do
        @item.postage_payer_id = 
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it 'prefectureが空の場合' do
        @item.preparation_day_id = 
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end
      it 'areaが空の場合' do
        @item.area_id = 
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'priceが¥10,000,000以上の場合' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが¥300以下の場合' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
    end
  end
end