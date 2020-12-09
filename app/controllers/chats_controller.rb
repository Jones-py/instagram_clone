class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  before_action :authenticate_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :logged_in?

  def index
    @chats=Chat.all
  end

  def new
    if params[:back]
      @chat = Chat.new(chat_params)
    else
      @chat = Chat.new
    end
  end

  def edit
  end

  def show
    @chat=Chat.find(params[:id])
    @favorite = current_user.favorites.find_by(chat_id: @chat.id)
  end

  def create
     @chat = Chat.new(chat_params)
     @chat.user_id=current_user.id
     if @chat.save
       ChatMailer.chat_mail(@chat).deliver
       redirect_to chats_path, notice: "New Post!"
     else
       render :new
     end
   end

  def update
   @chat= Chat.find(params[:id])
     if @chat.update(chat_params)
        redirect_to chats_path, notice: " Edited Post! "
     else
      render :edit
     end
  end

  def confirm
    @chat=Chat.new(chat_params)
    @chat.user_id=current_user.id
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
    params.require(:chat).permit(:post, :image, :image_cache, :user_id, :id)
  end
  def require_same_user
    if current_user != @chat.user
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @chat
    end
  end
end
