class FavoritesController < ApplicationController

def index
  @favorites=Favorite.all
end

  def create
     favorite = current_user.favorites.create(chat_id: params[:chat_id])
     redirect_to chats_url, notice: "#{favorite.chat.user.name}'S chat has been added to favorites"
   end
   def destroy
     favorite = current_user.favorites.find_by(id: params[:id]).destroy
     redirect_to chats_url, notice: "#{favorite.chat.user.name}Unblogged Mr.'s chat"
   end
end
