class LikesController < ApplicationController
    before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    current_user.likes.create(micropost_id: @micropost.id)
    redirect_back_or_to root_url
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_back_or_to root_url
  end
end
