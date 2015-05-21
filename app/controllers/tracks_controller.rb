class TracksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_album

  def new
  end

  def show
    @track = @album.tracks.find params[:id]
  end

  def create
    @track = @album.tracks.create(track_params)
    if @track.save
      redirect_to album_track_path(@album.artist, @track)
    else
      render :new
    end
  end

  private

  def set_album
    @album = Album.find params[:album_id]
  end

  def track_params
    params.require(:track).permit(:name)
  end
end
