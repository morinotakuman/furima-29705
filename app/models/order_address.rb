class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :zip_code, :prefecture, :city, :street_number, :building_name, :phone_number 

  with_options presence: true do
    validates :token
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture, numericality: { other_than: 1 }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture: prefecture, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end