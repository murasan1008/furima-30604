class OderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :ship_region_id, :ship_city, :ship_block,
                :ship_building, :phone, :order

  with_options presence: { message: '入力された文字が空欄です' } do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: '半角数字、又は-を付けて入力して下さい'}
    validates :ship_city
    validates :ship_block
    validates :phone, format: {with: ^0\d{9,10}$, message: '半角数字、又は-を付けて入力して下さい'}
    validates :ship_region_id, numericality: { other_than: 1 message: '選択して下さい'}
  end
end