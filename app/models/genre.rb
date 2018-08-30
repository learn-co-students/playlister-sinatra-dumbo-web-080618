require_relative "concerns/slugifiable"
class Genre < ActiveRecord::Base
  include Slugifiable::InstanceMethod
  extend Slugifiable::ClassMethod
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  # def slug
  #   self.name.gsub(/[^a-zA-Z0-9]/, '-')
  # end
  # def self.find_by_slug(slug)
  #   self.all.find{|instance| slug == instance.slug}
  # end
end
