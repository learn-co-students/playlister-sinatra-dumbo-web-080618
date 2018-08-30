

class SongsController < ApplicationController

enable :sessions
use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb:'songs/index'
  end

  get '/songs/new' do
    erb:'songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @genres = params[:genres].map {|id| Genre.find(id)}
    @song = Song.create(name: params["Name"], artist_id: @artist.id)
    @song.genres = @genres
    @song.save

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get "/songs/:slug" do

    @song = Song.find_by_slug(params["slug"])
    @artist = @song.artist
    @genres = @song.genres
    # binding.pry
    erb:'songs/show'
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params["slug"])
    @artist = @song.artist
    @genres = @song.genres
    erb:'/songs/edit'
  end

  patch "/songs/:slug" do

    # @song = Song.find_by_slug(params["slug"])
    # @song.update(name: params["song_name"])
    # @song.artist.name = params["Artist Name"]
    # @song.save


    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
