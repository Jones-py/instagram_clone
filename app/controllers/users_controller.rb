class UsersController < ApplicationController
  before_action :set_user, only:[:index, :show, :edit, :favourite,:update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]


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

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id), notice: 'User was successfully created'
      else
        render :new
      end
    end

  def update
    @user= User.find(params[:id])
     if @user.update(user_params)
      redirect_to user_path(user.id), notice: " Account Updated!"
     else
      render :edit
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
  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end
  end
end
