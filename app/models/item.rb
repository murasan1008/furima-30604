class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_burden
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :days_to
end
