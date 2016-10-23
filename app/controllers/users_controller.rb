class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
#  before_action :set_message, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  if @user.save
      flash[:success] = "welcome to the Sample App"
      redirect_to @user 
  else
    render 'new'
  end
  end
  
  # rake routesでみた時 /users/:id/editになってるので
  # :idで対象ユーザーを指定されている
  # アクションの関数の中ではパラメータは params[:id]で参照できる
  def edit
    @user = User.find(params[:id])
    #@userは編集対象ユーザー
    
    if (current_user != @user)
      redirect_to root_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    #@userは対象ユーザー
    
    if (current_user != @user)
      redirect_to root_path
    end
    
    if (@user.update(user_profile))
      flash = "成功"
      redirect_to @user
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
  
  def user_profile
    params.require(:user).permit(:name, :email, :password,:password_confirmation, :area)
  end
end
