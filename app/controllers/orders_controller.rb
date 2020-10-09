class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :pay_item]
  before_action :redirect, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def address_params
    params.require(:order_address).permit(:zip_code, :prefecture, :city, :street_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: item.price,
        card: address_params[:token],
        currency: 'jpy'
      )
  end

  def item_find
    item = Item.find(params[:item_id])
  end

  def redirect
    if user_signed_in? && current_user.id == item.user_id
      redirect_to root_path
    end
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if Order.find_by(item_id: params[:item_id])
      redirect_to root_path
    end
  end
end
