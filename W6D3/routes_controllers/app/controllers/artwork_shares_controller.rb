class ArtworkSharesController < ApplicationController

    def index
        @artwork_shares = ArtworkShare.all
        render json: @artwork_shares
    end

    def create
        @artwork_share = ArtworkShare.new(artwork_share_params)
        if @artwork_share.save
            render json: @artwork_share
        else
            render json: @artwork_share.errors.full_messages, status: 411
        end
    end

    def destroy
        @as = ArtworkShare.find_by(id: params[:id])
        render json: @as
        @as.destroy
        
    end


    private
    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end
