module UserHelper
	private
	def set_parameters!
		@sort_by = %w(first_name last_name gender).include?(params[:sort_by]) ? params[:sort_by] : nil
	end

	def apply_filtering
		@users = @users.reorder("#{@sort_by}" => 'asc') if @sort_by
		@users = @users.where(last_name: params[:last_name]) if params[:last_name]
		@users = @users.where(first_name: params[:first_name]) if params[:first_name]
		@users = @users.where(gender: params[:gender].capitalize) if params[:gender] && %w(male female).include?(params[:gender].downcase)
	end
end