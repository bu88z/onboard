class Job < ActiveRecord::Base

	belongs_to :user
	has_many :submissions

	validates :title, presence: true, length: { minimum: 5 }
	validates :description, presence: true
	validates :company_name, presence: true
	validates :location, presence: true
	validates :company_tagline, presence: true

	geocoded_by :location, latitude: :latitute, longitude: :longitude 
	#not refer to latitude and longitude since we called the fields already like this
	after_validation :geocode 
	#fill in my long and lat based on location


end
