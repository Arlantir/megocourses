class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    
    authorize @users
  end

  def show
  end

  def edit
    authorize @user
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "Roles for user: #{@user.email} was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit({ role_ids: [] })
  end
end