class UsersController < ApplicationController
	include UserHelper

	before_action :set_parameters!

	def index
		@users = User.all.order_by(created_at: :desc)
		apply_filtering

		render json: {users: @users}, status: :ok
	end

	def create
		@user = User.new(user_params)

		if @user.save
			render json: {user: @user}, status: :created
		else
			render json: {errors: @user.errors}, status: :forbidden
		end
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params.except(:email))
			render json: {user: @user}, status: :accepted
		else
			render json: {errors: @user.errors}, status: :forbidden
		end
	end

	def destroy
		@user = User.find(params[:id])

		if @user.destroy
			render json: {}, status: :ok
		else
			render json: {}, status: :not_found
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :gender, :disabled, :first_name, :last_name, :password)
	end
end
