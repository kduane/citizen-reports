class LocalitiesController < ApplicationController

  def index
    @cities = Locality.all
  end

  def show
    @locality = Locality.find(params[:id])
    render :show
  end

  def new
    @locality = Locality.newl;kj
  end

  def create
    # binding.pry
    @locality = Locality.new(Locality_params)
    if @locality.save
      flash[:notice] = 'New Locality saved!'
      redirect_to @locality
    else
      render :new
    end
  end

  def search
    query = "%#{params[:query]}%"
    @cities = Locality
      .where('title ilike ? or description ilike ? or url ilike ?',
             query, query, query)
  end

  def edit
    @locality = Locality.find(params[:id])
  end

  def update
    @locality = Locality.find(params[:id])
    if @locality.update_attributes(locality_params)
      flash[:notice] = 'Thanks for updating!'
      redirect_to @locality
    else
      render 'edit'
    end
  end

  def destroy
    @locality = Locality.find(params[:id])
    @locality.destroy
    redirect_to @locality
  end

  private

  def locality_params
    params.require(:locality).permit(:name, :zip_code, :description, :representative)
  end
end
