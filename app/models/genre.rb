class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs


  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slig)
    all.select {|genre| genre.slug == slig}[0]
  end

end
