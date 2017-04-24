class LikesController < ApplicationController
  
  def new
    @like = Like.new
  end
  
  def show
  end
  
  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    respond_to do |format|
      if @like.save
        @like.image.like_number += 1
        url = "/images/" + @like.image_id.to_s
        format.html { redirect_to url, notice: t("LIKED") }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def set_like
      @like = Like.find(params[:id])
    end

    def like_params
      params.require(:like).permit(:user_id, :image_id)
    end
end
