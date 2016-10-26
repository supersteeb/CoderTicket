class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

#  extend TimeSplitter::Accessors
#  split_accessor :starts_at
 # split_accessor :ends_at

	def self.search(search)
	 where("name ILIKE ?", "%#{search}%").or(where(":extended_html_description ILIKE ?", "%#{search}%")).or(where("category.name ILIKE ?", "%#{search}%")).or(where("venue.name ILIKE ?", "%#{search}%")) #.or(where("section.name ILIKE ?", "%#{search}%"))) <= to also find section name string under food items... is it
	end

	def image_url_or_default
		if hero_image_url.present?
			hero_image_url
		else
			 "http://loremflickr.com/320/240/#{CGI.escape name}"
		end
	end


end
