class PopularImagesController < ApplicationController
  def index
    @image = Image.new
    @categories = Category.all
    @images = Image.popular_images
  end
end
