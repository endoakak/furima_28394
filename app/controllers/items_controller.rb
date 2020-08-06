class ItemsController < ApplicationController
  before_action :move_to_signup, except: [:index]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def move_to_signup
    return if user_signed_in?

    redirect_to new_user_registration_path
  end

  def item_params
    params.require(:item).permit(
      :name,
      :text,
      :category_id,
      :condition_id,
      :delivery_fee_id,
      :delivery_from_id,
      :delivery_day_id,
      :price,
      :image
    ).merge(user_id: current_user.id)
  end
end
