require 'pry'

class SongsController < ApplicationController

  get '/songs' do
    @song = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end


  post '/songs' do
    binding.pry
    @artist = Artist.find_or_create_by(name: params['artist']['name'])

    @song = Song.create(params[:id], @artist)
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
