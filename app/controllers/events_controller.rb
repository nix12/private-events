class EventsController < ApplicationController
	before_action :require_login, only: [:new, :create]

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			redirect_to @event
		else
			flash[:danger] = failure
			render 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	private

		def event_params
			params.require(:event).permit(:name, :description, :date, :time)
		end
end
