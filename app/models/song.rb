require_relative "concerns/slugifiable"
class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethod
  extend Slugifiable::ClassMethod
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  # def slug
  #   self.name.gsub(/[^a-zA-Z0-9]/, '-')
  # end
  # def self.find_by_slug(slug)
  #   self.all.find{|instance| slug == instance.slug}
  # end
end
