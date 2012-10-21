class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user and @user.authenticate(params[:session][:password])
      sign_in @user
      flash[:success] = "User signed in"
      redirect_back_or @user
    else
      flash[:error] = "Login failed. Check email/password entered"
      render :new
    end
  end

  def destroy
     sign_out
    redirect_to root_path
  end
end