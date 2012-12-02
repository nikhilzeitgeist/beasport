class SportsController < ApplicationController
  before_filter :signed_in_user, :super_user, :except => [:show, :index]

  def new
    @sport = Sport.new
  end

  def show
    @sport = Sport.find(params[:id])
  end

  def update

    @sport = Sport.find(params[:id])
    
    binding.pry

    if @sport.update_attributes(params[:sport])
      redirect_to @sport
    else
      render :edit
    end
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
     @sport = Sport.new(params[:sport])
     if @sport.save
        redirect_to @sport
      else
         render :new
    end


    #   can also be done like: {redirect_to :action => :index}
    #  note that redirect will ask browser to fire another request so better way could be like this
    #   {
    #     @sports = Sport.all
    #     render 'index' or render :action => :index or render :index
    #  }

  end
end

