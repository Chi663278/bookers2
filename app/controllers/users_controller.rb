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
end
