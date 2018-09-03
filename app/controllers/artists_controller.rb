class ArtistsController < ApplicationController

get "/artists" do #reading the artists
  @read_all = Artist.all
  erb :"artists/index"
end
get "/artists/:slug" do
  @artist = Artist.find_by_slug(params[:slug])
  erb :"artists/show"
end
# get "/artists/new" do #loads new form
#   @create = Artist.create(params)
#   erb  :"artists/new"
# end
# post "/artists" do #creates a post
#  @post = Artist.all
#  erb :"artists/new"
# end
#
#  get "/artists/:slug" do
#    @art_slug = Artist.find_by_slug(params["slug"])
#  end

end
