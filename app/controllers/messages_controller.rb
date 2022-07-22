class MessagesController < ApplicationController
  def create
    Message.create(user_id: params[:user_id], content: params[:content], dialog_id: params[:dialog_id])
    redirect_to(dialog_path(params[:dialog_id]))
  end

  def index
    @messages = []
    if params[:start_id].nil?
      @messages = Message.where(dialog_id: params[:dialog_id]).reverse
    else
      @messages = Message.where('id >= ? AND dialog_id = ?', params[:start_id], params[:dialog_id]).reverse
    end
    render(partial: 'messages/messages', locals: {messages: @messages})
  end
end
