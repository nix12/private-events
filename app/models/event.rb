class Event < ActiveRecord::Base
	belongs_to :creator, class_name: 'User'
	has_many :attendees, through: :event_attendences
	has_many :event_attendences

	scope :prev, -> { where(:date => date.past?) }
	scope :next, -> { where(:date => date.future?) }
end
