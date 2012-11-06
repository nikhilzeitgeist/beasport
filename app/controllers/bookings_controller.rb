class BookingsController < ApplicationController

  before_filter :signed_in_user, :only => [:index ]
  before_filter :signed_in_user, :only => [:create, :new]
  before_filter :signed_in_user, :super_or_correct_user, :only => [:edit, :update, :destroy]

  def create
    #Booking.create (params[:booking])      #Use this line if creating bookings directly from new view of booking.

    @sporcad = Sporcad.find(params[:sporcad_id])
    @booking = @sporcad.bookings.new(params[:booking])
    @booking.user_id = current_user.id

    if @booking.save
      redirect_to  @sporcad
    else
      render 'sporcads/show'
    end

  end

  def show

  end

  def update
    @sporcad = Sporcad.find(params[:sporcad_id])
    @booking = Booking.find(params[:id])
    @booking.update_attributes(params[:booking])
    @booking.user_id = current_user.id
    if  @booking.save        #here could have directly used if @booking.update_attribute(params[:booking])
      redirect_to @sporcad
    else
      render 'sporcads/show'
    end
  end

  def destroy
    @sporcad = Sporcad.find(params[:sporcad_id])
    @sporcad.bookings.find(params[:id]).destroy
    redirect_to @sporcad
  end

  def new
    @booking = Booking.new
  end

  def index
    @bookings = Booking.all
  end

  def edit
    @sporcad = Sporcad.find(params[:sporcad_id] )
    @booking = @sporcad.bookings.find(params[:id])
    render 'sporcads/show'
  end

  private

  def super_or_correct_user
    @user = Booking.find(params[:id]).user
    unless current_user?(@user) or current_user.role == "super"
      redirect_to root_path, :notice => "Action not allowed to this user"
    end
  end

end
