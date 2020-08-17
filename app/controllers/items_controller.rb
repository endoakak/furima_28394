class ItemsController < ApplicationController
  before_action :move_to_signup, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.all.order("created_at DESC").includes(:deal)
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

  def show
    @comment = Comment.new(item_id: @item.id)
  end

  def edit
    redirect_to item_path(@item.id) unless @item.user.id == current_user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to item_path(@item.id) unless @item.user.id == current_user.id
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def move_to_signup
    return if user_signed_in?

    redirect_to new_user_registration_path
  end

  def set_item
    @item = Item.find(params[:id])
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
