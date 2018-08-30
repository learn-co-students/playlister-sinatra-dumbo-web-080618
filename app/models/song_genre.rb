require_relative "concerns/slugifiable"
class SongGenre < ActiveRecord::Base
  include Slugifiable::InstanceMethod
  extend Slugifiable::ClassMethod
  belongs_to :song
  belongs_to :genre
end
