class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_burden
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :days_to
  has_one_attached :image

  validates :image,            presence: { message: "入力された文字が空欄です" }
  validates :name,             presence: { message: "入力された文字が空欄です" }
  validates :description,      presence: { message: "入力された文字が空欄です" }
  validates :price,            presence: { message: "入力された文字が空欄です" }
  with_options numericality: { other_than: 1, message: '選択して下さい' } do
    validates :genre_id
    validates :status_id
    validates :ship_burden_id
    validates :shipment_source_id
    validates :days_to_id
  end
  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字、又は規定価格の範囲内で入力して下さい' }
  validates :price, inclusion: { in: 300..9999999, message: '半角数字、又は規定価格の範囲内で入力して下さい' }
end
