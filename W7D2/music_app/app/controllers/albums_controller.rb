class AlbumsController < ApplicationController
    before_action :set_album, only: [:show, :edit, :update, :destroy]
    def set_album
        @album = Album.find_by(id: params[:id])
    end

    def new
        @band_id = params[:band_id]
        @album = Album.new
        render :new
    end

    def show
        render :show
    end

    def create
        @album = Album.new(album_params)
        # debugger
        if @album.save!
            redirect_to band_url(@album.band_id)
        else
            render :new
        end
    end

    def edit
        render :edit
    end

    def update
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            render :edit
        end

    end

    def destroy
        band = @album.band_id
        @album.destroy
        redirect_to band_url(band)
    end

    private
    def album_params
        params.require(:album).permit(:title, :year, :band_id, :studio)
    end
end
