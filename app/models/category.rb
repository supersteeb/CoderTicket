class Category < ActiveRecord::Base
  has_many :events, foreign_key: :event_id

  validates_inclusion_of :name, in: ['Entertainment', 'Learning', 'Everything Else']
  validates_uniqueness_of :name
end
