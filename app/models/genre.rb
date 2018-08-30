class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    lower = name.downcase.strip
    lower.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    stuff = self.all.find{|genre| genre.slug == slug}
  end

end
