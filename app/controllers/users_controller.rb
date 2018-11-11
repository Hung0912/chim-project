class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :update]
	before_action :check_authorization, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      redirect_to edit_user_path, :flash => { :error => "Update failed! Something went wrong!" }
    end

  end

  private
  	def check_authorization
  		unless  current_user.id == params[:id].to_i
  			redirect_to root_url
  		end
  	end

  	def user_params
  		params.require(:user).permit(:user_name, :description, :email, :password, :password_confirmation, :birthdate, :phone, :sex, :avatar)
	end
end
