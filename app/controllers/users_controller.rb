class UsersController < ApplicationController
  def index
    # render user based on id in ascending order
    @users = User.order(id: :asc)
  end

  # render specific user based on id
  def show
    @user = User.find(params[:id])
  end
end
