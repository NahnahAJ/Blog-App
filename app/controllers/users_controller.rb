class UsersController < ApplicationController
  def show
    @user = User.all
  end

  def index
    @users = User.all
  end
end
