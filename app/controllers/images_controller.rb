class ImagesController < ApplicationController
    def new
    end
    
    def show
        @image = Image.find(params[:id])
    end
end
