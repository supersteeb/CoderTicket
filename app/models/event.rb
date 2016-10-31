class Event < ActiveRecord::Base
  belongs_to :venue, foreign_key: :venue_id
  belongs_to :category, foreign_key: :category_id
  belongs_to :user
  has_many :ticket_types, dependent: :destroy 

  before_save :image_url_or_default
  validates_presence_of :extended_html_description, :venue, :category, :starts_at, :hero_image_url
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

#  extend TimeSplitter::Accessors
#  split_accessor :starts_at
 # split_accessor :ends_at

	def self.search(search)
	 where("name ILIKE ?", "%#{search}%")
	 where("extended_html_description ILIKE ?", "%#{search}%")
	end

	def published
		
	end


	def image_url_or_default
		if hero_image_url.present?
			hero_image_url
		else
			 "http://loremflickr.com/320/240/#{CGI.escape name}"
		end
	end

	def mark_as_published!
		self.published_at ||= Time.now
		save!
	end

	def published?
		published_at
	end

=begin #Note: don't think below needs to be there
	def published_events
		Event.all.where(user: self) #because you want the published event
	end

	#EXample:
	def sent_messages
		Message.where(sender: self)
	end

	def self.upcoming
	  Event.where('ends_at > ?', Time.now)
	end

	def published?
	  !published_at.nil?
	end

	def self.published
	  Event.where.not(published_at: nil)
	end

=begin
	def self.upcoming
	  # http://guides.rubyonrails.org/active_record_querying.html
	  where('starts_at > ?', Date.today).where.not('published_at' => nil)
	end

	def self.published user_id
	  where('user_id = ?', user_id).where.not('published_at' => nil)
	end

	def self.unpublished user_id
	  where('user_id = ?', user_id).where('published_at' => nil)
	end
=end



end
