class UsersController < ApplicationController
  include SimpleCaptcha::ControllerHelpers
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if simple_captcha_valid? && @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end


  private
  def user_params
    params.permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
