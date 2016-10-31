class User < ApplicationRecord
	has_secure_password

	has_many :events
	has_many :venues
	has_many :tickets
	
	validates :email, presence: true, uniqueness: { case_insensitive: true }
	validates :name, presence: true

	def published_events
		Event.where(user: self) #because you want the published event
	end

	def purchased_events
		Event.all.where(user_id: self)
	end

end
