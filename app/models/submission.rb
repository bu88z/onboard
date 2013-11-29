class Submission < ActiveRecord::Base

	belongs_to :user
	belongs_to :job

	validates :cover_letter, presence: true

end
