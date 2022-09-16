class ArtworksController < ApplicationController

    def index
        @artworks = Artwork.artworks_for_user_id(params[:user_id])
        render json: @artworks
    end
# helper function
    # def self.artworks_for_user_id(id)
    #     Artwork
    #     .select("*")
    #     .joins(:artwork_shares)
    #     .where("artworks.artist_id = (?) OR artwork_shares.viewer_id = (?)", id, id)
    # end

    def show
        @artwork = Artwork.find_by(id: params[:id])
        render json: @artwork
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            render json: @artwork
        else
            render json: ['this is some baaad art - no save']
        end
    end

    def update
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork.update(artwork_params)
            render json: @artwork
        else
            render json: ['cannot beat the original. no update']
        end
    end

    def destroy
        @artwork = Artwork.find_by(id: params[:id])
        @artwork.destroy
        render json: ['byebyebye! deleted']
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
