class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # # GET /users or /users.json
  def index
    @users = User.where(id: current_user.id)
  end

  # private

  def set_user
    @user = User.where(id: current_user.id)
  end

  # # Only allow a list of trusted parameters through.
  # def user_params
  #   params.require(:user).permit(:name, :email, :password)
  # end
  def show
    @user = User.where(id: current_user.id)
  end
end
