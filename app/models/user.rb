class User < ActiveRecord::Base
	# added some validations
	validates :name, presence: true, unless: :has_social_login?
	validates :username, presence: true, uniqueness: true, unless: :has_social_login?
	validates :email, presence: true, uniqueness: true, unless: :has_social_login?

	validates :password, presence: true, confirmation: true, unless: :has_social_login?

	# this is part of rails
	# it came in rails 3.2 and now is in 4.0
	# it puts our unencrypted password into our database as an encrypted password into password_digest
	has_secure_password validations: false

	def has_social_login?
		facebook_id.present? or twitter_id.present? or linkedin_id.present?
	end
end
