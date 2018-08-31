class Song < ActiveRecord::Base
  has_many :song_genres 
  belongs_to :artist
  has_many :genres, through: :song_genres

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