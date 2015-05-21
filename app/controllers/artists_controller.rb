class ArtistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @artist = Artist.all
  end

  def show
    @artist = Artist.find params[:id]
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  private
  def artist_params
    params.require(:artist).permit(:name)
  end

end
