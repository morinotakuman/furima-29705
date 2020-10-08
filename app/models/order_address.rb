class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture, :city, :street_number, :building_name, :phone_number 

  with_options presence: true do
    validates :zip_code
    validates :prefecture
    validates :city
    validates :street_number
    validates :phone_number
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture: prefecture, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end