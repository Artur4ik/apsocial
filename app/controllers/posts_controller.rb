class PostsController < ApplicationController
  def create
    Post.create(user_id: params[:user_id], target_id: params[:target_id], text: params[:text])
    redirect_to(user_path(id: params[:target_id]))
  end

  def destroy
    redirect_id = Post.find(params[:id]).delete

    redirect_to(user_path(id: redirect_id.target_id))
  end
end
