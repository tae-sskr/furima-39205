require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: @user.id, item_id: @item.id)
  end

  describe '購入者情報の保存' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order_shipping).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空だと購入できない' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefectureに「1」が選択されている場合は購入できない' do
        @order_shipping.prefecture_id = '1'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'address1が空だと購入できない' do
        @order_shipping.address1 = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'telephoneが空だと購入できない' do
        @order_shipping.telephone = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneは9桁以下だと購入できない' do
        @order_shipping.telephone = '123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneは12桁以上だと購入できない' do
        @order_shipping.telephone = '123456789123'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneは半角数字以外が含まれている場合だと購入できない' do
        @order_shipping.telephone = '090-1234'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Telephone is invalid")
      end
      it 'tokenが空だと購入できない' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end