class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  # def get_name(file_path)
  #   string = File.path("db/data/A$AP Rocky - Peso [dance].mp3")
  #   ##file parser
  #   ## anything before the dash
  # end


  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slig)
    all.select {|artist| artist.slug == slig}[0]
  end



end
