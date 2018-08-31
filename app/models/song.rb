class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    # self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slig)
    all.select {|song| song.slug == slig}[0]
  end

end
