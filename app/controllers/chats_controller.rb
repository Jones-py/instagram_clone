class ChatsController < ApplicationController
  before_action :set_chat, only:[:show, :edit, :update, :destroy]
  def index
    @chats=Chat.all
  end

  def show
  end

  def edit
    @chat=Chat.new
  end

  def edit
  end

  def create
    @chat= Chat.new(chat_params)
      # @chat.user_id=current_User.id
      if params[:back]
       render :new
      else
       if @chat.save
        redirect_to chats_path, notice: "New Post!"
       else
        render :new
       end
     end
  end

  def update

  end

  def destroy
    @chat.destroy
    redirect_to chats_path, notice:"I deleted the post!"
  end

  private
  def set_chat
    @chat=Chat.find(params[:id])
  end
  def chat_params
    params.require(:chat).permit(:post, :user_id, :id)
  end
end
