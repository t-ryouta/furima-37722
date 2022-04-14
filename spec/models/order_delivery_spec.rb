require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '配送先情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
      sleep 0.05
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_delivery.post_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery.post_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'area_idを選択していないと保存できないこと' do
        @order_delivery.area_id = '1'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_delivery.address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは10桁以下では保存できないこと' do
        @order_delivery.phone_number = '123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberは全角数字では保存できない' do
        @order_delivery.phone_number = '０９０１２３４５６７８'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end