class SearchesController < ApplicationController
  def index
    if params[:search].blank?
      flash[:warning] = "Search can not be empty !"
      redirect_to root_path
    else
      @images = Image.search(params[:search]) || Array.new
      @users = User.search(params[:search]) || Array.new
      @addresses = Image.search(params[:search]).distinct
        .pluck(:address) || Array.new
      @categories = Category.search(params[:search]) || Array.new
    end
    respond_to do |format|
      format.html {load_data_static}
      format.js do
        render json: {images: @images, users: @users,
          addresses: @addresses, categories: @categories, status: 200}
      end
    end
  end
end
