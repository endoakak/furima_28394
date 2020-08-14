class UsersController < ApplicationController
  def show
  end

  def update
    binding.pry
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :email)
  end
end
