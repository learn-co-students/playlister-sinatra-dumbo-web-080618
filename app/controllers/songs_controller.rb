class SongsController < ApplicationController

  get "/songs" do  #get it to be 200
    @songs = Song.all
    erb:"songs/index"
  end
  get "/songs/new" do # only directing to form
    @genres = Genre.all #want all genre to acess all for new genres
    erb :"songs/new" #new will only take user to form
  end
  post "/songs" do
    # binding.pry
    song_genre = params[:genre].map{|x| Genre.find_by(name: x)} #gives instance of genre
    # @song = Song.create(params)
    song_name = params["song_name"]
    artist_name = params["artist_name"]
    artist = Artist.find_or_create_by(name:artist_name)
    @song = Song.create(name: song_name, artist_id: artist.id)

    @song.genres = song_genre

    redirect to "/songs/#{@song.slug}" # redirecting to song with the edits defined in models under slug 


  end
  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb:"songs/show"
  end
  # get '/songs/new' do
  #   #bring us to form
  #
  #   erb :"songs/new"
  # end
  #
  # post '/songs/new' do
  #   @song = Song.create(params[:name])
  #
  # end


end
