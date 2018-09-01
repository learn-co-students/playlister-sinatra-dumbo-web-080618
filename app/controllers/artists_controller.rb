require 'pry'

class ArtistsController < ApplicationController

  get '/artists' do
    @artist = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @songs = @artist.songs
    erb :'/artists/show'
  end


end
