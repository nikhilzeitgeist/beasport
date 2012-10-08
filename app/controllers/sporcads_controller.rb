class SporcadsController < ApplicationController
  def create
    Sporcad.create(params[:sporcad])
    redirect_to sporcads_path
  end

  def show
    @sporcad = Sporcad.find(params[:id])
  end

  def update
    Sporcad.find(params[:id]).update_attributes(params[:sporcad])
    redirect_to  Sporcad.find(params[:id])
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
