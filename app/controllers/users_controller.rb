class UsersController < ApplicationController
  before_action :check_login, only: [:show, :log_out]
  def index

  end
  def create
    user = User.new(register_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/posts'
    else
      flash[:errors] = user.errors.full_messages
      redirect_back(fallback_location: :back)
    end
  end
  def login
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/posts'
    else
      flash[:log_errors] = 'Invalid login'
      redirect_back(fallback_location: :back)
    end
  end

  def show
    @user = User.find(params[:id])
  end
  def log_out
    session[:user_id] = nil
    redirect_to '/'
  end
  private
  def register_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end
end
