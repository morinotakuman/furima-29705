class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash [:category, :state, :bearer, :area, :day]

  with_options presence: true do
    validates :name
    validates :description
    validates :categories_id
    validates :state_id
    validates :bearer_id
    validates :area_id
    validates :days_id
    validates :price_id
  end

  with_options numericality: { other_than: 1 } do
    validates :categories_id
    validates :state_id
    validates :bearer_id
    validates :area_id
    validates :days_id
  end

  validates :price_id, numericality: { only_integer: true }, inclusion: {in: 300..9999999}

end
