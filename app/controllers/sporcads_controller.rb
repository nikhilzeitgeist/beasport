class SporcadsController < ApplicationController
    before_filter :signed_in_user, :super_or_correct_seller_user, :only => [:edit,:update, :destroy]
    before_filter :signed_in_user, :only => [:index]
    before_filter :signed_in_user, :super_or_seller_user, :only => [:create,:new]
  def create

    if current_user.academy_ids.include?((params[:sporcad][:academy_id]).to_i)  or current_user.role == "super"
      @sporcad = Sporcad.new(params[:sporcad])
      if @sporcad.save
        redirect_to @sporcad
      else
        render :new
      end
    else
      redirect_to root_path, :notice => "This action can not be peformed by current user"
    end
  end

  def show
    @sporcad = Sporcad.find(params[:id])
    @booking = @sporcad.bookings.build
  end

  def update
    @sporcad = Sporcad.find(params[:id])
    if @sporcad.update_attributes(params[:sporcad])
      redirect_to @sporcad
    else
      render :edit
    end
  end

  def destroy
    Sporcad.find(params[:id]).destroy
    redirect_to sporcads_path
  end

  def index
    @sporcads = Sporcad.all
  end

  def new
    @sporcad = Sporcad.new

  end

  def edit
    @sporcad = Sporcad.find(params[:id])
  end

  private

  def super_or_correct_seller_user

    @user = Sporcad.find(params[:id]).academy.user  #User.find_by_id(Sporcad.find(params[:id]).academy.user_id )

    unless (current_user?(@user) and current_user.role=="seller") or current_user.role== "super"
      redirect_to root_path, :notice => "Action not allowed to this user"
    end
  end
end
