class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @friends = @user.friends
    @posts = Post.where(target_id: params[:id])
    @photos = Photo.where(user_id: params[:id])
  end

  def index
    @users = nil

    unless params[:query].nil?
      @users = User.where(
        User.arel_table[:first_name]
            .lower
            .matches("%#{params[:query].downcase}%")) unless params[:query].blank?
    end
    respond_to do |format|
      format.html
      format.json do
        if params[:query].nil? || params[:query].blank?
          @users = User.all
        else
          @users = User.where(
            User.arel_table[:first_name]
                .lower
                .matches("%#{params[:query].downcase}%"))
        end
        render json: @users
      end
     end
  end
end
