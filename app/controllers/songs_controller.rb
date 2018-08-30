require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.all.find{|song| song.match_slug(params['slug'])}
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    flash[:message] = "Successfully updated song." 
    redirect to "songs/"
  end

  get '/songs/:slug' do
    @song = Song.all.find{|song| song.match_slug(params['slug'])}
    erb :'songs/show'
  end

  # {"song_name"=>"That One with the Guitar",
  #   "artist_name"=>"Person with a Face",
  #   "genre"=>["New Age Garbage"]}
  post '/songs' do 
    @genres = params['genre'].map{|x| Genre.find_by(:name=> x)}
    @artist = Artist.find_or_create_by(name: params['artist_name'])    
    # binding.pry
    
    @song = Song.create(name: params['song_name'], artist_id: @artist.id, genres: @genres)
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

end
