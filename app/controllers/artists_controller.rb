class ArtistsController < ApplicationController

  get "/artists" do
    @artists = Artist.all
    erb :'artists/index'
  end

  get "/artists/new" do
    erb :"artists/new"
  end

  post "/artists" do
    @name = params[:name]

    erb :"artists/show"
  end

  # get "/artists/:id" do
  #   @artists =  Artist.find(params[:id])
  # end
end
