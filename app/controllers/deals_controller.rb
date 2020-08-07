class DealsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @deal = Deal.new(user_id: deal_params[:user_id], item_id: deal_params[:item_id])
    if @deal.valid?
      pay_item
      @deal.save
      redirect_to root_path
    else
      @item = Item.find(deal_params[:item_id])
      render :new
    end

  end

  private

  def deal_params
    params.permit(:token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @deal.item.price,  # 商品の値段
      card: deal_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end
end
