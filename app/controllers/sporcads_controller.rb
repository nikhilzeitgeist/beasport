class SporcadsController < ApplicationController
  def create
    @sporcad = Sporcad.new(params[:sporcad])
    if @sporcad.save
      redirct_to @sporcad
    else
      render :new
    end
  end

  def show
    @sporcad = Sporcad.find(params[:id])
    @booking = @sporcad.bookings.build
  end

  def update
    @sporcad = Sporcad.find(params[:id])
    if @sportcad.update_attributes(params[:sporcad])
      redirct_to @sporcad
    else
      render :new
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
end
