class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @user = User.page(params[:id])
  end

  def show

  end

  def edit
  end

  def update
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
