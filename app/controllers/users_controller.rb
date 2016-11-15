class UsersController < ApplicationController
	before_action :require_login, only: [:show]

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			redirect_to @user
		else
			flash.now[:danger] = 'Sign up failure'
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])

		if params[:prev]
   		@events = current_user.events.where('date <= ?', Date.today)
		else
			@events = current_user.events.where('date >= ?', Date.tomorrow)
		end

		
		# @prev_events = current_user.prev_events
	end

	private

		def user_params
			params.require(:user).permit(:name, :email)
		end
end
