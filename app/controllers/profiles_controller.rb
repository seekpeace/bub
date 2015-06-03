class ProfilesController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = current_user
		@profile = current_user.profile
		@friends = current_profile.friends
	end

	def new 
		@user = current_user
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.user_id = current_user.id
		if @profile.save
			redirect_to @profile
		else 
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy 
		@profile = Profile.find(params[:id])
		@profile.destroy
		redirect_to root_url
	end

	private
		def profile_params
			params.require(:profile).permit(:name, :age, :location, :phone_number, :email)
		end
end