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
  with_options presence: { message: "入力された文字が空欄です" }, numericality: { other_than: 1, message: '選択して下さい' } do
    validates :genre
    validates :status
    validates :ship_burden
    validates :shipment_source
    validates :days_to
  end
  validates :price, inclusion: { in: 300..9999999, message: '規定価格の範囲内で入力して下さい' },
    format: { with: /\A[0-9]+\z/, message: '規定価格の範囲内で入力して下さい'}
end
