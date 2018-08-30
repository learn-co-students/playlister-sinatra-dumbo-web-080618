require_relative "concerns/slugifiable"
class Artist < ActiveRecord::Base
  include Slugifiable::InstanceMethod
  extend Slugifiable::ClassMethod
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres
end
