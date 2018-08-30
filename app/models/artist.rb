class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    lower = name.downcase.strip
    lower.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    stuff = self.all.find{|artist| artist.slug == slug}
  end

end
