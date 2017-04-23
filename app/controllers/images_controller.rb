class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def new
    @image = Image.new
    @categories = Category.all
  end

  def show
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    @image.like_number = 0
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        @categories = Category.all
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:user_id, :image, :address,
        :category_id, :description, :like_number, :review, :created_at)
    end
end
