class User < ActiveRecord::Base
	has_many :events, :foreign_key => :creator_id 
	has_many :attended_event, through: :event_attendences, source: :event_attendence
	has_many :event_attendences

	# def prev_events
	# 	self.events.each do |event|
	# 		if event.date.past?
	# 			p event 
	# 		end
	# 	end
	# end
end
