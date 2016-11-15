class EventAttendence < ActiveRecord::Base
	belongs_to :event_attendence, class_name: 'Event'
	belongs_to :attendee, class_name: 'User'
end
