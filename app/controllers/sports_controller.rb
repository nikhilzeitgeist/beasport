class SportsController < ApplicationController
  def new
    @sport = Sport.new
  end

  def update
    @sport = Sport.find(params[:id])
    @sport.update_attributes(params[:sport])
    @sports = Sport.all
    redirect_to sports_path
  end

  def destroy
    Sport.find(params[:id]).destroy
    redirect_to sports_path
  end

  def index
    @sports = Sport.all

  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def create
     Sport.create(params[:sport])
    redirect_to sports_path

    #   can also be done like: {redirect_to :action => :index}
    #  note that redirect will ask browser to fire another request so better way could be like this
    #   {
    #     @sports = Sport.all
    #     render 'index' or render :action => :index or render :index
    #  }

  end
end

