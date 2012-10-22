class AcademiesController < ApplicationController

  before_filter :signed_in_user, :super_or_correct_seller_user, :only => [:edit,:update, :destroy]
  before_filter :signed_in_user, :super_or_seller_user, :only => [:create,:new]
  before_filter :signed_in_user, :super_user, :only => [:index]

  def new
    @academy = Academy.new
  end

  def update
  	@academy = @user.academies.find(params[:id])
    if @academy.update_attributes(params[:academy])
      redirect_to @academy
    else
      render :edit
    end
  end

  def show
  	@academy = Academy.find(params[:id])  
  	
  end

  def destroy
    @user.academies.find(params[:id]).destroy
    redirect_to academies_path
  end

  def index
    @academies = Academy.all

  end

  def edit
  	@academy = @user.academies.find(params[:id])
  end

  def create

    @academy = current_user.academies.new(params[:academy])

      if  @academy.save
        redirect_to @academy
     else
       render :action => :new
     end

     #   can also be done like: {redirect_to :action => :index}
     #  note that redirect will ask browser to fire another request so better way could be like this
     #   {
     #     @academies = Academy.all
     #     render 'index' or render :action => :index or render :index
     #  }

  end

  private

  def super_or_correct_seller_user
    @user = Academy.find(params[:id]).user

    unless (current_user?(@user) and current_user.role=="seller") or current_user.role== "super"
      redirect_to root_path, :notice => "Action not allowed to this user"
    end
  end
end

