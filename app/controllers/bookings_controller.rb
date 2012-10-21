class BookingsController < ApplicationController
  def create
    #Booking.create (params[:booking])      #Use this line if creating bookings directly from new view of booking.

    @sporcad = Sporcad.find(params[:sporcad_id])
    @booking = @sporcad.bookings.new(params[:booking])

    if @booking.save
      redirect_to @sporcad
    else
      render :new
    end

  end

  def show

  end

  def update
    @sporcad = Sporcad.find(params[:sporcad_id])
    @booking = Booking.find(params[:id])

    if @booking.update_attributes(params[:booking])
      redirect_to @sporcad
    else
      render :edit
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
  end

  def edit
    @sporcad = Sporcad.find(params[:sporcad_id] )
    @booking = @sporcad.bookings.find(params[:id])
    render 'sporcads/show'
  end

end
