require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の保存' do
    it '商品画像がないと保存が出来ない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Image 入力された文字が空欄です')
    end
    it '商品名が空だと保存が出来ない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Name 入力された文字が空欄です')
    end
    it '商品の説明が空だと保存が出来ない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Description 入力された文字が空欄です')
    end
    it 'カテゴリーの情報がないと保存が出来ない' do
      @item.genre_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Genre 選択して下さい')
    end
    it '商品の状態についての情婦がないと保存が出来ない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status 選択して下さい')
    end
    it '配送料の負担についての情報がないと保存が出来ない' do
      @item.ship_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship burden 選択して下さい')
    end
    it '発送元の地域についての情婦がないと保存が出来ない' do
      @item.shipment_source_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipment source 選択して下さい')
    end
    it '発送までの日数についての情婦がないと保存が出来ない' do
      @item.days_to_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to 選択して下さい')
    end
    it '価格についての情報が空だと保存が出来ない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 入力された文字が空欄です')
    end
    it '価格の範囲が¥300~¥9999999の範囲でないと保存が出来ない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 半角数字、又は規定価格の範囲内で入力して下さい')
    end
    it '価格の範囲が¥300~¥9999999の範囲でないと保存が出来ない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 半角数字、又は規定価格の範囲内で入力して下さい')
    end
    it '販売価格は半角数字でないと保存が出来ない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 半角数字、又は規定価格の範囲内で入力して下さい')
    end
  end
end
