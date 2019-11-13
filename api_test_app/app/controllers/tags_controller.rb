class TagsController < ApplicationController

	def index
		@tags = Tag.all.order_by(created_at: %w(asc desc).include?(params[:order_by]) ? params[:order_by].to_sym : :desc )

		render json: {tags: @tags}, status: :ok
	end

	def create
		@tag = User.find(params[:user_id]).tags.new(tag_params)

		if @tag.save
			render json: {tag: @tag}, status: :created
		else
			render json: {errors: @tag.errors}, status: :forbidden
		end
	end

	def update
		@tag = User.find(params[:user_id]).tags.where(id: params[:id]).first

		if @tag.update_attributes(tag_params)
			render json: {tag: @tag}, status: :accepted
		else
			render json: {errors: @tag.errors}, status: :forbidden
		end
	end

	def destroy
		@tag = User.find(params[:user_id]).tags.where(id: params[:id]).first

		if @tag.destroy
			render json: {}, status: :ok
		else
			render json: {}, status: :not_found
		end
	end

	def add_user
		@tag = Tag.where(id: params[:tag_id]).first

		if @tag.update_attributes(user_id: current_user.id)
			render json: {tag: @tag}, status: :accepted
		else
			render json: {errors: @tag.errors}, status: :forbidden
		end
	end

	def remove_user
		@tag = Tag.where(id: params[:tag_id]).first

		if @tag.update_attributes(user_id: nil)
			render json: {tag: @tag}, status: :accepted
		else
			render json: {errors: @tag.errors}, status: :forbidden
		end
	end

	private

	def tag_params
		params.require(:tag).permit(:name, :user_id)
	end
end
