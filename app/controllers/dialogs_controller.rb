class DialogsController < ApplicationController
  before_action :check_user_signed_in

  def new

  end

  def create
    @user = current_user
    @recipient = User.find(params[:id])
    @dialog = Dialog.create(name: "#{@user.first_name}, #{@recipient.first_name}")
    @dialog.users << @user
    @dialog.users << @recipient
    redirect_to(dialog_path(id: @dialog.id))
  end

  def index
    @user = current_user
    @dialogs = @user.dialogs
  end

  def show
    @user = current_user
    @dialog = Dialog.find(params[:id])
    @companion = (@dialog.users - [current_user]).first
    @messages = @dialog.messages.reverse
  end

  private

  def check_user_signed_in
    redirect_to(root_path) unless user_signed_in?
  end
end
