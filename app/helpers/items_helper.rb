module ItemsHelper
  def is_available(item)
    if !user_signed_in?
      return false
    end

    if item.user.id == current_user.id
      return false
    end

    if item.deal
      return false
    end

    return true
  end

  def is_owner(item)
    if !user_signed_in?
      return false
    end

    if item.user.id == current_user.id
      return true
    end

    return false
  end
end
