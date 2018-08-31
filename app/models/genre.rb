class Genre < ActiveRecord::Base
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  has_many :song_genres

  def slug
    self.name.gsub(' ','-').downcase
  end

  def match_slug(slugged)
    if slugged == self.slug
      self
    end
  end

  def self.find_by_slug(slug)
    self.all.find{|element| element.slug == slug}
  end
  
end