class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def super_or_seller_user
      unless current_user.role == "seller" or current_user.role=="super"
      redirect_to root_path, :notice => "No permission to this user"
    end
  end

  def signed_in_user
    unless signed_in?
      store_url
      redirect_to signin_path, :notice => "Please sign in first"
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path, :notice => "Action not allowed to this user" unless current_user?(@user)
  end

  def super_or_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user) or current_user.role== "super"
      redirect_to root_path, :notice => "Action not allowed to this user"
    end
  end

  def super_user
    unless current_user.role== "super"
      redirect_to root_path, :notice => "Can't see this part of the world my dear!"
    end
  end


end
