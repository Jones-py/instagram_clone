class UsersController < ApplicationController
  before_action :set_user, only:[:index, :show, :edit, :favourite,:update, :destroy]

  def index
    @users=User.all
  end
  def new
    @user=User.new
    if logged_in?
    redirect_to chats_path
   end
  end
  def show

  end

  def edit
  end

  def update
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id), notice: 'User was successfully created'
      else
        render :new
      end
    end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name,:favpic,:favpic_cache, :email, :password,
                                   :password_confirmation)
  end
end
