class UsersController < ApplicationController
  def index
    @user=User.all
  end
  def new
    @user=User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="Hello #{@user}Sign up was successful"
      redirect_to chats_path
    else
     render :new
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
end
