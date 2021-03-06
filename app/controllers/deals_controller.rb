class DealsController < ApplicationController
  before_action :check_permission

  def new
    @item = Item.find(params[:item_id])
    @deal = DealShipment.new
  end

  def create
    @deal = DealShipment.new(deal_params)
    @item = Item.find(deal_params[:item_id])
    if @deal.valid?
      pay_item
      @deal.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def check_permission
    item = Item.find(params[:item_id])
    # ログインしてなければサインアップ画面へ
    if !user_signed_in?
      redirect_to new_user_registration_path
    # 出品者ならトップ画面へ
    elsif item.user_id == current_user.id
      redirect_to root_path
    # 売り切れならトップ画面へ
    elsif item.deal
      redirect_to root_path
    # カードを登録していなければ登録画面へ
    elsif !current_user.card.present?
      redirect_to new_card_path
    # 全条件をクリアしたらカード情報を取得
    else
      customer = Payjp::Customer.retrieve(current_user.card.customer_token)
      @card = customer.cards.first
    end
  end

  def deal_params
    params.permit(
      :item_id,
      :post_code,
      :prefecture_id,
      :city, :address,
      :building,
      :phone_number
    ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      customer: current_user.card.customer_token,
      currency: 'jpy'
    )
  end
end
