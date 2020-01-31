class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role, :nickname)
  end

end
