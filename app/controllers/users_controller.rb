class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:name, :introduction))
      flash[:notice] = "プロフィールを更新しました"
      redirect_to users_profile_path
    end
  end
end
