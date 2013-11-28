class User < ActiveRecord::Base
	# added some validations
	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true

	# this is part of rails
	# it came in rails 3.2 and now is in 4.0
	# it puts our unencrypted password into our database as an encrypted password into password_digest
	has_secure_password
end
