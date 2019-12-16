class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
    @user.profiles.build
  end

  def create
    @user = User.new user_params
    if @user.save
      login_user @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to users_url
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find(params[:id]) 
    if @user.update_attributes user_param 
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find params[:id]
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city_id,
      profiles_attributes: [:id, :address, :_destroy])
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please login"
      redirect_to login_url
    end
  end
  
  def correct_user
    @user = User.find params[:id]
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
