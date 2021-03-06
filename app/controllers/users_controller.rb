class UsersController < ApplicationController
 # before_filter :signed_in_user, :only => [:edit, :update, :index]
 # before_filter :correct_user, :only =>  [:edit, :update]
  before_filter :signed_in_user, :super_or_correct_user, :only => [:destroy,:edit,:update]
  before_filter :signed_in_user, :super_user, :only => [:index]

  def new
    @user = User.new
  end

  def create
    if params[:user][:role] == "buyer" or params[:user][:role] == "seller"
      @user = User.new(:name => params[:user][:name],:email => params[:user][:email],
      								 :password => params[:user][:password],
                       :password_confirmation => params[:user][:password_confirmation])
       @user.role = params[:user][:role]
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        render :new
      end
    else
      redirect_to new_user_path, :notice => "Can't create that kind of user"
    end

=begin
      #this was previously used code but above code is used to get rid of mass assignment problem
    #@user = User.new(params[:user])

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render :new
    end
=end
  end

  def index
    @users = User.all
  end

  def edit
  #  @user = User.find(params[:id])    # Commented since used in correct_user filter
  end

  def update

    if params[:user][:role] == "buyer" or params[:user][:role] == "seller"
     @user.update_attributes(:name => params[:user][:name],:email => params[:user][:email],
     												 :password => params[:user][:password],
                             :password_confirmation => params[:user][:password_confirmation])
      @user.role = params[:user][:role]
      if @user.save
        sign_in @user
        flash[:success] = "Information updated successfully!"
        redirect_to @user
      else
        render :edit
      end
    else
      redirect_to edit_user_path(@user), :notice => "Can't create that kind of user"
    end
=begin
#this was previously used code but above code is used to get rid of mass assignment problem
   # @user = User.find(params[:id])    # Commented since used in correct_user filter

    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
=end
  end


  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy
    flash[:success] = "User destroyed"
    redirect_to :back
  end

  private


end
