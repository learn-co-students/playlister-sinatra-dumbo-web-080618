class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    lower = name.downcase
    lower.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    stuff = self.all.find{|song| song.slug == slug}
  end
end
