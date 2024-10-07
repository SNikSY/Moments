# app/controllers/moments_controller.rb
class MomentsController < ApplicationController
  def index
    @moments = Moment.includes(:user, :likes, :comments).order(created_at: :desc)
  end

  def show
    @moment = Moment.find(params[:id])
  end
end
