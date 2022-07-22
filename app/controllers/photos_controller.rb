class PhotosController < ApplicationController
  def create
    Photo.create(user_id: params[:user_id], data: params[:data])
    redirect_to(user_photos_path(user_id: params[:user_id]))
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def index
    @photos = Photo.where(user_id: params[:user_id])
  end
end
