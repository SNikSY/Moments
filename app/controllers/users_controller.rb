class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @moments = @user.moments.order(created_at: :desc)
  end
end
