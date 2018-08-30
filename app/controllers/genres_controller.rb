class GenresController < ApplicationController
  get '/genres' do 
    @genres = Genre.all
    erb :'/genres/index'
  end

  # @genres = []
  # @genre.songs.each{|song| song.genres.each{|sg| @genres << sg}}
  # erb :'/artists/show'
    get '/genres/:slug' do 
      @genre = Genre.all.find{|genre| genre.match_slug(params['slug'])}
      erb :'genres/show'
    end
end