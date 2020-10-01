class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :categories_id, :state_id, :bearer_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
