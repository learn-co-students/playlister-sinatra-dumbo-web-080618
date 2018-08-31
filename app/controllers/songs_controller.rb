require 'rack-flash'

class SongsController < ApplicationController

enable :sessions
use Rack::Flash

  get "/songs" do
    @songs = Song.all

    erb :"songs/index"
  end


  get "/songs/new" do


    erb :"songs/new"
  end





  post "/songs" do

    # binding.pry

    @artist = Artist.find_or_create_by(name: params["artist"])
    @song = Song.create(name: params["name"], artist: @artist)

    params["genres"].each do |genre|
        @song.genres << Genre.find(genre)
      end
  #
  #

  #
  # artist = Artist.find_or_create_by(name: params["artist"])
  # @song.artist = artist
  #   binding.pry
  # @song.save
  # @song.reload

  flash[:message] = "Successfully created song."
  # flash

  redirect to("/songs/#{@song.slug}")
  end

  get "/songs/:slug" do

    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  get "/songs/:slug/edit" do

    @song = Song.find_by_slug(params[:slug])
  erb :"songs/edit"
  end

  patch "/songs/:slug" do

    @song = Song.find_by_slug(params[:slug])

    # binding.pry
    if !(params["name"] == @song.name || params["name"].length == 0)
    @song.name = (params["name"])
    @song.save
    end

    if !(params["genres"].sort == @songs.genres.sort || params["genres"] == nil)
      @song.genres.clear

      params["genres"].each do |genre|
        @song.genres << Genre.find_where(name: genre)
      end
      @song.save
    end

    if !(params["artist"] == @song.artist || params["artist"].length == 0)
      artist = Artist.find_or_create_by(name: params["artist"])
    @song.artist = artist
    @song.save
    end

    @song
    redirect to ("/song/#{@song.slug}")


  end



  # private
  #
  # def flash
  #   puts "Successfully created song."
  # end

end
