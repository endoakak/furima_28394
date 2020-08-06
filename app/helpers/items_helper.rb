module ItemsHelper
  def available?(item)
    # ログインしているかチェック
    unless user_signed_in?
      return false
    end

    # 出品者ではないかチェック
    if item.user.id == current_user.id
      return false
    end

    # 商品が売り切れていないかチェック
    if item.deal
      return false
    end

    return true
  end

  def owner?(item)
    # ログインしているかチェック
    unless user_signed_in?
      return false
    end

    # 出品者であることをチェック
    if item.user.id == current_user.id
      return true
    end

    return false
  end
end
