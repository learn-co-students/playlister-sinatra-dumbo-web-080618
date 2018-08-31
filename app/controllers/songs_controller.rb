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

  get '/songs/:slug' do
    @song = Song.all.find{|song| song.match_slug(params['slug'])}
    erb :'songs/show'
  end

  post '/songs' do 
    @genres = params['genre'].map{|x| Genre.find_by(:name=> x)}
    @artist = Artist.find_or_create_by(name: params['artist_name'])    
    @song = Song.create(name: params['song_name'], artist_id: @artist.id, genres: @genres)
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.all.find{|song| song.match_slug(params['slug'])}
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song]) #update has to be called right after you create an instance variable that refers to the model or else it won't work, any changes to the model in question to return an invalid response
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")
  end



  # {"song_name"=>"That One with the Guitar",
  #   "artist_name"=>"Person with a Face",
  #   "genre"=>["New Age Garbage"]}


end
