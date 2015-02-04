class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if params[:user][:avatar].class.to_s == "String"
      @user.image_data = params[:user][:avatar]
      @user.save
    else
      @user.save
      redirect_to @user
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      if params[:user][:avatar].present?
        render 'crop'
      else
        redirect_to @user
      end
    else
      render 'new'
    end
  end
end

private

def find_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:name, :avatar, :crop_x, :crop_y, :crop_w, :crop_h)
end
