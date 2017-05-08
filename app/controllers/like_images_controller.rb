class LikeImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
    
    def new
        @like_image = LikeImage.new
    end
    
    def create
        @like_image = LikeImage.new(like_image_params)
        @like_image.user_id = current_user.id
        respond_to do |format|
            if @like_image.save
                url = "/images/" + @like_image.image_id.to_s
                format.html { redirect_to url, notice: t("message.success_created_image_like_image") }
                format.json { render :show, status: :created, location: @like_image }
            else
                format.html { render :new }
                format.json { render json: @like_image.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
      @like_image = LikeImage.find(params[:id])
      url = "/images/" + @like_image.image_id.to_s
      @like_image.destroy
      respond_to do |format|
        format.html { redirect_to url, notice: t("message.success_deleted_image_like_image") }
        format.json { head :no_content }
      end
    end    
    
    private
    def set_like_image
      @like_image = LikeImage.find(params[:id])
    end

    def like_image_params
      params.require(:like_image).permit(:user_id, :image_id)
    end
end
