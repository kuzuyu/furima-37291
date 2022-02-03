require 'rails_helper'

RSpec.describe OrderRecords, type: :model do
  before do
    @order_records = FactoryBot.build(:order_records)
  end

  describe '寄付情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_records).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @order_records.post_number = nil
        @order_records.valid?
        expect(@order_records.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせじゃない場合' do
        @order_records.post_number = '1234560'
        @order_records.valid?
        expect(@order_records.errors.full_messages).to include("Post number is invalid")
      end
      it '都道府県が「---」を選択していた場合' do
        @order_records.area_id = 1
        @order_records.valid?
        expect(@order_records.errors.full_messages).to include("Area must be other than 1")
      end
      it '都道府県が空の場合' do
        @order_records.area_id = nil
        @order_records.valid?
        expect(@order_records.errors.full_messages).to include("Area is not a number")
      end
      it '市区町村が空の場合' do
        @order_records.city = nil
        @order_records.valid?
        expect(@order_records.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空の場合' do
        @order_records.address = nil
        @order_records.valid?
        expect(@order_records.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空の場合' do
        @order_records.phone_number = nil
        @order_records.valid?
        expect(@order_records.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が12桁以上ある場合' do
        @order_records.phone_number = '111222333444555'
        @order_records.valid?
        expect(@order_records.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空の場合' do
        @order_records.user_id = nil
        @order_records.valid?
        expect(@order_records.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空の場合' do
        @order_records.item_id = nil
        @order_records.valid?
        expect(@order_records.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空の場合' do
        @order_records.token = nil
        @order_records.valid?
        expect(@order_records.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end