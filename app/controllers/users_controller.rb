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
    if @user.save
      redirect_to @user
    end
  end

  def edit
  end

  def update
      if params[:user][:avatar].present?
        if params[:user][:avatar].class.to_s == "String"
          update_attrs(@user, params)
          respond_to do |format|
            format.js
          end
        else
          @user.update(user_params)
          render 'crop'
        end
      else
        @user.update(user_params)
        redirect_to @user
      end
  end
end

private

def update_attrs(user, params)
  user.image_data = params[:user][:avatar]
  user.crop_x = params[:user][:crop_x]
  user.crop_y = params[:user][:crop_y]
  user.crop_w = params[:user][:crop_w]
  user.crop_h = params[:user][:crop_h]
  user.avatar = user.avatar
  user.save
end

def find_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:name, :avatar, :crop_x, :crop_y, :crop_w, :crop_h)
end
