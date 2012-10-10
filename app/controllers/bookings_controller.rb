class BookingsController < ApplicationController
  def create
    #Booking.create (params[:booking])      #Use this line if creating bookings directly from new view of booking.

    @sporcad = Sporcad.find(params[:sporcad_id])
    @booking = @sporcad.bookings.create(params[:booking])

    redirect_to @sporcad
  end

  def show
  end

  def update
  end

  def destroy
    @sporcad = Sporcad.find(params[:sporcad_id])
    @sporcad.bookings.find(params[:id]).destroy
    redirect_to @sporcad
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def index
  end
end
