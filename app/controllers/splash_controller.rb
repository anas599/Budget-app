class SplashController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @groups = Group.all
  end
end
