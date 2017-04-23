class UsersController < ApplicationController
	def show
		@user = User.find_by(id: params[:id])
		@image = User.all
	end
	def edit
		@user = User.find_by(id: params[:id])
	end
	def update
		@user = User.find_by(id: params[:id])
		if @user.update_attributes(params_user)
			flash.now[:success] = "Your profile is successfull updated"
      redirect_to @user
		else
			render 'edit'
		end
	end

	private
	def params_user
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end
end
