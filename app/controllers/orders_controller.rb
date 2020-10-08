class OrdersController < ApplicationController
  def index
    item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
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

  def create
    @order_address = OrderAddress.new(address_params)
    binding.pry
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def address_params
    params.require(:order_address).permit(:zip_code, :prefecture, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
