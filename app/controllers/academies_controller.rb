class AcademiesController < ApplicationController
  def new
    @academy = Academy.new
  end

  def update
  	@academy = Academy.find(params[:id])
    if @academy.update_attributes(params[:academy])
      redirct_to @academy
    else
      render :new
    end
  end

  def show
  	@academy = Academy.find(params[:id])  
  	
  end

  def destroy
    Academy.find(params[:id]).destroy
    redirect_to academies_path
  end

  def index
    @academies = Academy.all

  end

  def edit
  	@academy = Academy.find(params[:id])
  end

  def create

    @academy = Academy.new(params[:academy])

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
end

