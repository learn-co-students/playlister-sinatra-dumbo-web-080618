require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @songs = Song.all
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres
    @artist = @song.artist
    erb :'songs/show'
  end



  post '/songs' do
    @artist = Artist.find_or_create_by(name:params[:artist_name])
    @song = Song.create(name: params[:name])
    params[:genres].each do |genre|
      @song.song_genres << SongGenre.create(song_id: @song.id, genre_id: genre.to_i)
    end
    @song.artist = @artist
    @song.save
    flash[:message] = "Successfully created song."

    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres
    @artist = @song.artist
    erb :'songs/edit'
  end

  patch '/songs' do

    @artist = Artist.find_or_create_by(name:params[:artist_name])
    @song = Song.find_or_create_by(name:params[:name])
    @song.update(artist_id: @artist.id)
    @song.song_genres.clear
    params[:genres].each do |genre|
      @song.song_genres.create(song_id: @song.id, genre_id: Genre.find_by(name: genre).id)
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

end
