class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def update
    @band = Band.find_by(id: params[:id])

    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      @band = Band.find_by(id: params[:id])
      render :edit
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    @band.destroy
    redirect_to bands_url
  end

  def band_params
    params.require(:band).permit(:name, :picture)
  end
end