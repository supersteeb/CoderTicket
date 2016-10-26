class User < ApplicationRecord
	has_secure_password

	validates :email, presence: true, uniqueness: { case_insensitive: true }
	validates :name, presence: true
end
