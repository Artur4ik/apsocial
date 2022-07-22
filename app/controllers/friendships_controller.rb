class FriendshipsController < ApplicationController
  def create
    Friendship.create(user_id: params[:id], recipient_id: params[:user_id])
    Friendship.create(user_id: params[:user_id], recipient_id: params[:id])
    redirect_to(user_path(id: params[:user_id]))
  end

  def destroy
    Friendship.find_by(user_id: params[:id], recipient_id: params[:user_id]).delete
    Friendship.find_by(user_id: params[:user_id], recipient_id: params[:id]).delete
    redirect_to(user_path(id: params[:user_id]))
  end
end
