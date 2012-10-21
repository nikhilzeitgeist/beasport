class UsersController < ApplicationController
  before_filter :signed_in_user, :only => [:edit, :update]
  before_filter :correct_user, :only =>  [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def edit
  #  @user = User.find(params[:id])    # Commented since used in correct_user filter
  end

  def update
   # @user = User.find(params[:id])    # Commented since used in correct_user filter

    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end


  def show
    @user = User.find(params[:id])
  end

  private

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

end
