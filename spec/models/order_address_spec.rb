require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
  end

  describe '商品購入情報の保存' do
    it '配送先の郵便番号がないと購入が出来ない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code 入力された文字が空欄です")
    end
    it '配送先の郵便番号に-がないと購入が出来ない' do
      @order_address.postal_code = '2222222'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code -を付けて入力して下さい")
    end
    it '配送先の都道府県がないと購入が出来ない' do
      @order_address.ship_region_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Ship region 選択して下さい")
    end
    it '配送先の市区村町がないと購入が出来ない' do
      @order_address.ship_city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Ship city 入力された文字が空欄です")
    end
    it '配送先の番地がないと購入が出来ない' do
      @order_address.ship_block = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Ship block 入力された文字が空欄です")
    end
    it '配送先の電話番号がないと購入が出来ない' do
      @order_address.phone = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone 入力された文字が空欄です")
    end
    it '配送先の電話番号に-があるとと購入が出来ない' do
      @order_address.phone = '090-1111-1111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone -を付けずに11ケタ以内の数字で入力して下さい")
    end
    it '配送先の電話番号が11桁以内でないと購入が出来ない' do
      @order_address.phone = '090111111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone -を付けずに11ケタ以内の数字で入力して下さい")
    end
    it 'tokenが空では登録できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token 入力された文字が空欄です")
    end
  end
end
