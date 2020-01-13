class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if signed_in?
      sign_out
      redirect_to root_path
    else
      render "top/index"
    end
  end
end
