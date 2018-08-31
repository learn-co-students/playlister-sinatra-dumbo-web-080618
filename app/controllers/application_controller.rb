require 'pry'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    "hello"
  end

  
end



# <p><a href='/genres/<%= song.song_genres[0].genre.slug %>'><%= song.song_genres[0].genre.name %></p>
# <% end %>


# <% if flash.has?(:message) %>
#   <%= flash[:message] %>
# <% end %>
