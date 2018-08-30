require_relative "concerns/slugifiable"
class SongGenre < ActiveRecord::Base
  include Slugifiable::InstanceMethod
  extend Slugifiable::ClassMethod
  belongs_to :song
  belongs_to :genre
  # def slug
  #   self.name.gsub(/[^a-zA-Z0-9]/, '-')
  # end
  # def self.find_by_slug(slug)
  #   self.all.find{|instance| slug == instance.slug}
  # end
end
