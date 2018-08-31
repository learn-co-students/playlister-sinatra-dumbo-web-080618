ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])


ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)


require_all 'app'
require_all 'lib'

enable :sessions
require 'sinatra/base'
require 'rack-flash'

# abc = Artist.new("abc")
# abc.slug
#
# Pry.start
