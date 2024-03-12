class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(permitted_params)
      redirect_to '/admin/users'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def authenticate_admin!
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end

  def permitted_params
    params.require(:user).permit(:email, :role)
  end
end
