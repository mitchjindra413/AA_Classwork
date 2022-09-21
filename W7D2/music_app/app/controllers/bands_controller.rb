class BandsController < ApplicationController
    before_action :set_band, only: [:show, :edit, :update, :destroy]

    def set_band
        @band = Band.find_by(id: params[:id])
    end

    def index
        @bands = Band.all
        render :index
    end

    def show
        render :show
    end

    def new
        @band = Band.new
        render :new
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to band_url(@band)
        else
            render :new
        end
    end

    def edit
        render :edit
    end

    def update
        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            render :edit
        end
    end

    def destroy
        @band.destroy
        redirect_to bands_url
    end


    private
    def band_params
        params.require(:band).permit(:name)
    end
end
