class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def show
    @like_image = LikeImage.new
    @comment = Comment.new
    @comments = Comment.find_by image_id: @image.id, parent_id: 0
    @image.like_number = @image.like_images.count
  end

  def new
    @image = Image.new
    @categories = Category.all
  end

  def edit
    @categories = Category.all
  end
  
  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    @image.like_number = 0
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: t("message.success_created_image") }
        format.json { render :show, status: :created, location: @image }
      else
        @categories = Category.all
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: t("message.success_updated_image") }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: t("message.success_deleted_image") }
      format.json { head :no_content }
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
