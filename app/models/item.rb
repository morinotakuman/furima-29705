class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :bearer
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :name
    validates :description
    validates :categories_id
    validates :state_id
    validates :bearer_id
    validates :area_id
    validates :days_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :categories_id
    validates :state_id
    validates :bearer_id
    validates :area_id
    validates :days_id
  end

  validates :price, numericality: { only_integer: true }, inclusion: {in: 300..9999999}

end
