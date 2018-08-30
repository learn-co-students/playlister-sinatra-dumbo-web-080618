class ArtistsController < ApplicationController
  get '/artists' do 
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.all.find{|artist| artist.match_slug(params['slug'])}
    @genres = []
    @artist.songs.each{|song| song.genres.each{|sg| @genres << sg}}
    erb :'/artists/show'
  end
end
