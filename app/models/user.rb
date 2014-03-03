class User < ActiveRecord::Base
	has_secure_password

	validates :email, uniqueness: true
	validates :email, presence: true

	validates_uniqueness_of :email

end
